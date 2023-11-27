// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["nuxt-primevue", '@pinia/nuxt'],
  components: [{ path: "@/components", pathPrefix: false }],
  primevue: {
    options: {
      ripple: true,
    },
    components: {
      include: '*',
      exclude: []
  }
  },
  css: ['primevue/resources/themes/lara-dark-purple/theme.css', 'normalize.css/normalize.css']
});