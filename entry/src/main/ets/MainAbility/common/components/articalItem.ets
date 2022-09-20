@Component
struct ArticalItem {
  build() {
    GridContainer({ columns:12,gutter: 5, margin: 5 }) {
      Row(){
        Image("/common/img/chijing.gif")
          .width('100%')
          .height(60)
          .borderRadius(15)
          .useSizeType({
            sm:{span:3,offset:0},
            md:{span:4,offset:0}
          })
        Column(){
          Text('测试标题测试测试测试测试测试')
            .width('100%')
            .textAlign(TextAlign.Start)
            .textOverflow({overflow:TextOverflow.Ellipsis})
            .maxLines(1)
            .fontSize(16)
          Text('2022-09-19')
            .width('100%')
            .fontSize(14)
            .textAlign(TextAlign.Start)
            .margin({left:5})
            .lineHeight(40)
        }.useSizeType({
          sm:{span:7,offset:3},
          md:{span:6,offset:4}
        })
        Flex(){
          Image('/common/img/ji.png')
            .width(30)
            .borderRadius(5)
            .objectFit(ImageFit.Cover)
        }.useSizeType({
          sm:{span:2,offset:10},
          md:{span:2,offset:11}
        })
      }
      .width('100%')
      .border({width:5,color:'#dcdcdc'})
      .padding(5)
      .borderRadius(10)
    }
  }
}

export default ArticalItem