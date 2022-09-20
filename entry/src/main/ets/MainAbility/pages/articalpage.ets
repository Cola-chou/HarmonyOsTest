import MyAlert from '../common/components/myalert'
import { Article, ContentItem } from '../common/model/Article'
import ArticleContent from '../common/components/articleContent/articleContent'

@Entry
@Component
struct ArticalPage {
  // @Provide 发送 @Consume 接收 跨组件数据传输
  @Provide('articleContent') article: Article = new Article({
    title: '第一篇文章内容',
    content: [
      new ContentItem({
        content_index: 0,
        content_type: 'text',
        content_data: "Django 有丰富的文档。一份高度概述的文档会告诉你在哪里找到特定的东西：教程 通过一系列的步骤来带领你创建一个网页应用" +
        "程序。如果你是 Django 或网页应用开发的新手，可以从这里开始。" }),
      new ContentItem({
        content_index: 1
      , content_type: 'image',
        content_data: '/common/img/j20.jpg' }),
      new ContentItem({
        content_index: 2,
        content_type: 'text',
        content_data: "Django 有丰富的文档。一份高度概述的文档会告诉你在哪里找到特定的东西：教程 通过一系列的步骤来带领你创建一个网页应用" +
        "程序。如果你是 Django 或网页应用开发的新手，可以从这里开始。" }),
      new ContentItem({
        content_index: 3
      , content_type: 'image',
        content_data: '/common/img/j11d.jpg' })

    ]
  })
  @State message: string = 'Hello world'
  addDiyController: CustomDialogController = new CustomDialogController({
    builder: MyAlert({ addImg: this.addImg, addText: this.addText,article:this.article }),
    alignment: DialogAlignment.Bottom // 弹窗靠底部
  })

  addImg() {
    console.info('addImg')
  }

  addText() {
    console.info('addText')
  }

  build() {
    Flex({ direction: FlexDirection.Column,
      justifyContent: FlexAlign.Start,
      alignItems: ItemAlign.Center }) {
      Text(this.article.title)
        .width('100%')
        .fontSize(20)
        .fontColor('#ff6e6e6e')
        .padding(5)
        .textAlign(TextAlign.Start)
      //        .border({width:1})
      Button('保存')
        .width(80)
        .height(30)
        .position({ x: '100%', y: 0 })
        .markAnchor({ x: 80, y: 0 })
      Divider()
        .strokeWidth(1) // 分割线 strokeWidth分割线重量
        .color('#777')

      //文章内容列表
      ArticleContent()

      Button('添加图文组件')
        .width(160)
        .height(40)
        .onClick(() => {
          this.addDiyController.open()
        })

    }.padding(10)
  }
}