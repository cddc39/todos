<template>
  <ul>
    <li v-for="(todolist, index) in todoLists" :key="index">
      <span class="name">{{ todolist.name }}</span>
      <span class="delete" @click="Delete(todolist.id)"> x </span>
    </li>
  </ul>
</template>

<script>
export default {
  props: {
    todoLists: {
      type: Array,
      default() {
        return []
      },
    },
    delete: {
      type: Function,
      default() {
        return
      },
    },
  },
}
</script>
