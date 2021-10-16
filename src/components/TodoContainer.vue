<script>
import TodoList from "./TodoList.vue"
import { ref } from "@vue/runtime-core"
export default {
  components: {
    TodoList,
  },
  setup() {
    let exampleData = [
      { id: 1, name: "cook" },
      { id: 2, name: "eat" },
      { id: 3, name: "repeat" },
    ]
    return {
      TodoLists: ref(exampleData),
      msg: "",
    }
  },
  methods: {
    Create() {
      let id = 4
      id += 1
      const next = { id, name: this.msg }
      this.TodoLists.push(next)
    },
    Delete(id) {
      this.TodoLists = this.TodoLists.filter((r) => r.id != id)
    },
  },
}
</script>

<template>
  <h1>Todo</h1>
  <div class="container">
    <input v-model="msg" type="text" />
    <button @click="Create">Create</button>
    <TodoList :todo-lists="TodoLists" :delete="Delete" />
  </div>
</template>
