import { defineAppSetup } from '@slidev/types'

export default defineAppSetup(({ app, router }) => {

  if (typeof window !== 'undefined') {
    // Workaround for Slidev 52.x navigation bug:
    // Slidev constructs slide nav paths from window.location.pathname (which includes
    // the router base), then passes them to router.push(). Vue Router 4 treats pushed
    // paths as virtual routes (base-relative), so the base gets doubled in the final URL.
    // This interceptor strips the base prefix before it reaches Vue Router.
    if (router) {
      const base: string = (router as any).options?.history?.base ?? ''
      const routerBase = base.endsWith('/') ? base.slice(0, -1) : base
      const routerBaseRelative = routerBase.replace(/^\//, '')

      if (routerBase) {
        const stripBase = (path: string): string => {
          if (path.startsWith(routerBase))
            return path.slice(routerBase.length) || '/'
          if (routerBaseRelative && path.startsWith(routerBaseRelative))
            return path.slice(routerBaseRelative.length) || '/'
          return path
        }

        const origPush = router.push.bind(router)
        const origReplace = router.replace.bind(router)

        router.push = (to: any) => {
          if (to?.path) return origPush({ ...to, path: stripBase(to.path) })
          if (typeof to === 'string') return origPush(stripBase(to))
          return origPush(to)
        }
        router.replace = (to: any) => {
          if (to?.path) return origReplace({ ...to, path: stripBase(to.path) })
          if (typeof to === 'string') return origReplace(stripBase(to))
          return origReplace(to)
        }
      }
    }

    // Handle 404 redirects with slide number preservation
    const urlParams = new URLSearchParams(window.location.search)
    const targetSlide = urlParams.get('slide')

    if (targetSlide && router) {
      router.isReady().then(() => {
        const slideNumber = Number.parseInt(targetSlide.match(/\d+$/)?.[0] ?? '', 10)
        if (Number.isInteger(slideNumber) && slideNumber > 0) {
          router.replace(`/${slideNumber}`).then(() => {
            const cleanUrl = window.location.pathname + window.location.hash
            window.history.replaceState({}, '', cleanUrl)
          })
        }
      })
    }
  }
})
