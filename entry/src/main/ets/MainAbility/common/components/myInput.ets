//封装组件 MyInput组件封装
@Component
struct MyInput {
  @Link inputValue: string
  //  @Prop placeholder:string 向父组件暴露一个placeholder变量接口
  @Prop placeholder: string
  @Prop label:string
  private inputType:InputType = InputType.Normal
  //  每一个组件必须要有一个build()来渲染
  build() {
    Row({ space: 5 }) {
      Text(this.label)
        .fontSize(18)
      TextInput({ placeholder: this.placeholder, text: this.inputValue })
        .onChange((value: string) => {
          this.inputValue = value
        })
        .type(this.inputType)
        .width('80%')
        .height(40)
        .margin({ top: 5 })
        .border({ width: 1, color: '#000' })
        .borderRadius(20)
        .backgroundColor('#fff')
    }
  }
}

// 暴露向其他组件暴露该组件
export default MyInput