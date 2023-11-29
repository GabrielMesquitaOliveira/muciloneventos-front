<!-- components/EventList.vue -->

<template>
  <div>
    <h2>Lista de Eventos</h2>
    <div v-if="loading">Carregando...</div>
    <div v-else>
      <div v-for="event in events" :key="event.id">
        <h3>{{ event.nomeEvento }}</h3>
        <p>Data: {{ event.dataEvento }}</p>
        <p>Local: {{ event.local }}</p>
        <p>Descrição: {{ event.descricao }}</p>
        <hr />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      events: [],
      loading: true,
    };
  },
  mounted() {
    // Chame sua API para obter a lista de eventos
    this.fetchEvents();
  },
  methods: {
    async fetchEvents() {
      try {
        // Substitua a URL abaixo pela sua API endpoint
        const response = await fetch('localhost/events');
        const data = await response.json();
        this.events = data;
      } catch (error) {
        console.error('Erro ao obter eventos:', error);
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped>
/* Estilos específicos do componente, se necessário */
</style>
