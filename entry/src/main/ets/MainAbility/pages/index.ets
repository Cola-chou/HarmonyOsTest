import router from '@ohos.router';
import MyInput from "../common/components/myInput"

@Entry
@Preview
@Component
struct Index {
  @State message :string = 'helloworld'
  @State username: string = '12ssdf'
  @State password: string = 'sdfsdf'
  private username_reg = /^[A-Za-z0-9]{5,8}$/;
  //控制台测试
  //  onPageShow(){
  //    let test_res = this.username_reg.test(this.username)
  //    // @ts-ignore
  //    console.info(test_res)
  //  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center }) {
      Text('登录')
        .fontSize(40)
        .fontWeight(700)
      if (!this.username_reg.test(this.username)) {
        Text('用户名必须5-8位 英文或数字')
          .fontSize(12)
          .fontColor('#ff0000')
          .fontWeight(700)
          .width('100%')
      }

      MyInput({ label: '用户名',
        placeholder: '输入用户名',
        inputValue: $username,
        inputType: InputType.Normal })
      MyInput({ label: '密码',
        placeholder: '输入密码',
        inputValue: $password,
        inputType: InputType.Password })

      Button('进入app')
        .onClick(()=>{
          router.push({
            url:'pages/home'
          })
        })
    }
    .width('100%')
    .height('100%')
    .border({ width: 10, color: '#000' })
    .backgroundColor('#fff')
  }

//  build(){
//    Row() {
//      Column() {
//        Text(this.message)
//          .fontSize(50)
//          .fontWeight(FontWeight.Bold)
//        // 添加按钮，以响应用户点击
//        Button(){
//          Text('Next')
//            .fontSize(30)
//            .fontWeight(FontWeight.Bold)
//        }
//        .type(ButtonType.Capsule)
//        .margin({
//          top:20
//        })
//        .backgroundColor('#0D9FFB')
//        .width('40%')
//        .height('5%')
//        // 跳转按钮绑定onClick事件,点击时跳转到第二页
//        .onClick(()=>{
//          router.push({url:'pages/second'})
//        })
//      }
//      .width('100%')
//    }
//    .height('100%')
//  }
}