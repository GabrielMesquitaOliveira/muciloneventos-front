// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["@nuxt/ui", "nuxt-primevue"],
  components: [{ path: "@/components", pathPrefix: false }],
  primevue: {
    options: {
      ripple: true,
    },
    components: {
      include: ['Button']
    },
  },
  css: ['primevue/resources/themes/lara-dark-purple/theme.css']
});
