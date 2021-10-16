import { mount } from "@vue/test-utils"
import TodoContainer from "./TodoContainer.vue"

describe("TodoContainer", () => {
  it("should display header text", () => {
    const wrapper = mount(TodoContainer)

    expect(wrapper.find("h1").text()).toEqual("Todo")
  })
})
