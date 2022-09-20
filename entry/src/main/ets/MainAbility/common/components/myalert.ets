import wantConstant from '@ohos.ability.wantConstant';
import featureAbility from '@ohos.ability.featureAbility';
import { Article, ContentItem } from '../model/Article';

// 弹窗组件封装
@CustomDialog
struct MyAlert {
  controller: CustomDialogController
  addImg: () => void // 图片组件回调函数
  addText: () => void // 文字组件回调函数
  @ObjectLink article: Article


  build() {
    Flex({ direction: FlexDirection.Row,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Button('图片组件')
        .onClick(() => {
          let new_item
          if (this.article.content.length > 0) {
            new_item = new ContentItem({
              content_index: this.article.content[this.article.content.length-1].content_index + 1,
              content_type: 'image',
              content_data: '/common/img/j15.jpg'
            })
          } else {
            new_item = new ContentItem({
              content_index: 0,
              content_type: 'image',
              content_data: '/common/img/j15.jpg'
            })
          }
          let new_arr = JSON.parse(JSON.stringify(this.article.content))
          new_arr.push(new_item)
          this.article.content = new_arr
          //          console.info(JSON.stringify(this.article))
          this.controller.close()
        })
      Button('文字组件')
        .onClick(() => {
          let new_item
          if (this.article.content.length > 0) {
            new_item = new ContentItem({
              content_index: this.article.content[this.article.content.length-1].content_index + 1,
              content_type: 'text',
              content_data: "Django 有丰富的文档。一份高度概述的文档会告诉你在哪里找到特定的东西：教程 通过一系列的步骤来带领你创建一个网页应用" +
              "程序。如果你是 Django 或网页应用开发的新手，可以从这里开始。"
            })
          } else {
            new_item = new ContentItem({
              content_index: 0,
              content_type: 'text',
              content_data: "Django 有丰富的文档。一份高度概述的文档会告诉你在哪里找到特定的东西：教程 通过一系列的步骤来带领你创建一个网页应用" +
              "程序。如果你是 Django 或网页应用开发的新手，可以从这里开始。"
            })
          }
          let new_arr = JSON.parse(JSON.stringify(this.article.content))
          new_arr.push(new_item)
          this.article.content = new_arr
          this.controller.close()
        })
    }
    .width('100%')
    .height(200)
  }
}

export default MyAlert