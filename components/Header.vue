<template>
  <Menubar :model="items">
    <template #start>
      <svg width="35" height="40" viewBox="0 0 35 40" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-2rem">
        <path d="..." fill="var(--primary-color)" />
        <path d="..." fill="var(--text-color)" />
      </svg>
    </template>
    <template #item="{ item, props, hasSubmenu, root }">
      <a v-ripple class="flex align-items-center" v-bind="props.action">
        <span :class="item.icon" />
        <span class="ml-2">{{ item.label }}</span>
        <Badge v-if="item.badge" :class="{ 'ml-auto': !root, 'ml-2': root }" :value="item.badge" />
        <span v-if="item.shortcut" class="ml-auto border-1 surface-border border-round surface-100 text-xs p-1">{{
          item.shortcut }}</span>
        <i v-if="hasSubmenu"
          :class="['pi pi-angle-down text-primary', { 'pi-angle-down ml-2': root, 'pi-angle-right ml-auto': !root }]"></i>
      </a>
    </template>
    <template #end>
      <div class="flex align-items-center gap-2">
        <InputText placeholder="Search" type="text" class="w-8rem sm:w-auto" />
      </div>
    </template>
  </Menubar>
</template>

<script lang="ts" setup>
import { ref } from "vue";

const items = ref([
  {
    label: 'Home',
    icon: 'pi pi-home'
  },
  {
    label: 'Features',
    icon: 'pi pi-star'
  },
  {
    label: 'Projects',
    icon: 'pi pi-search',
  },
  {
    label: 'Contact',
    icon: 'pi pi-envelope',
  }
]);

</script>

<style lang="scss" scoped></style>
