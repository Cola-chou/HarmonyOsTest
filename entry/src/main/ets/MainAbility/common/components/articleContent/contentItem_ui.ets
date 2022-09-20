import wantConstant from '@ohos.ability.wantConstant';
import featureAbility from '@ohos.ability.featureAbility';
import { Article } from '../../model/Article';
@Component
struct ContentItem_UI {
  @Prop content_type: string
  @Prop content_data: string
  @Prop content_index: number
  @Link userClick: number
  @Consume('articleContent') article: Article

  chooseFile() {
    featureAbility.startAbilityForResult({
      want: {
        action: 'ohos.hidisk.intent.action.choose'
      }
    }).then((data) => {
      console.info('*************startAbility****************')
    })

  }

  deleteItem() {
    //     深拷贝 this.article.content 的值,用于删除并且触发@Consume的更新机制
    var new_arr = JSON.parse(JSON.stringify(this.article.content))
    //    var new_arr = this.article.content    此处为浅拷贝，this.article.content 修改未能被 eTS语法检测到
    console.info(JSON.stringify(new_arr))
    new_arr.forEach((item, index) => {
      if (item.content_index == this.userClick) {
        new_arr.splice(index, 1)
        //            更新 @provide 传过来的数据
        this.article.content = new_arr
      }
    })
    //    let new_arr = this.article.content
    //    console.info(JSON.stringify(new_arr))
    //    new_arr.splice(this.userClick,1)
    //    new_arr = JSON.parse(JSON.stringify(this.article.content))
    //    this.article.content = new_arr
    //    console.info(JSON.stringify(new_arr))
  }

  build() {
    Column() {
      if (this.content_type == 'text') {
        Text(this.content_data)
          .fontSize(14)
          .fontColor('#ff6e6e6e')
          .margin(5)
          .onClick(() => {
            this.userClick = this.content_index
          })
        if (this.userClick == this.content_index) {
          Text(this.content_data)
            .fontSize(14)
            .fontColor('#ff6e6e6e')
            .margin(5)
            .position({ x: 0, y: 0 })
            .backgroundColor('#cccccc')
          Button('编辑')
            .width(65)
            .height(30)
            .type(ButtonType.Normal)
            .backgroundColor('#ffc4b449')
            .position({ x: 0, y: 0 })
          Button('删除')
            .width(65)
            .height(30)
            .type(ButtonType.Normal)
            .backgroundColor('#98ff0000')
            .position({ x: 65, y: 0 })
            .onClick(() => {
              this.deleteItem()
            })
        }
      }
      if (this.content_type == 'image') {
        Image(this.content_data)
          .width('100%')
          .height(360 / 16 * 10)
          .objectFit(ImageFit.Cover)
          .margin(5)
          .onClick(() => {
            this.userClick = this.content_index
          })
        if (this.userClick == this.content_index) {
          Image(this.content_data)
            .width('100%')
            .height(360 / 16 * 10)
            .objectFit(ImageFit.Cover)
            .position({ x: -5, y: 0 })
            .blur(20)
            .margin(5)
          Button('编辑')
            .width(65)
            .height(30)
            .type(ButtonType.Normal)
            .backgroundColor('#ffc4b449')
            .position({ x: 0, y: 0 })
            .onClick(()=>{
              this.chooseFile()
            })
          Button('删除')
            .width(65)
            .height(30)
            .type(ButtonType.Normal)
            .backgroundColor('#98ff0000')
            .position({ x: 65, y: 0 })
            .onClick(() => {
              this.deleteItem()
            })
        }
      }
    }
  }
}

export default ContentItem_UI