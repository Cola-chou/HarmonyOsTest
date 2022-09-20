@Component
struct MyGrid {
  @Link btnList: number[]
  build() {
    Grid() {
      ForEach(this.btnList, (item, index) => {
        if (index == 0) {
          GridItem() {
            Button('图文' + item)
              .type(ButtonType.Normal)
              .width('100%')
              .height('100%')
              .borderRadius(5)
          }
          .rowStart(0)
          .rowEnd(1)
          .columnStart(0)
          .columnEnd(1)
        }
        if (index > 0 && index < 3) {
          GridItem() {
            Button('图文' + item)
              .type(ButtonType.Normal)
              .width('100%')
              .height('100%')
              .borderRadius(5)
          }
          .rowStart(0)
          .rowEnd(0)
          .columnStart(0)
          .columnEnd(0)
        }
        if (index == 3) {
          GridItem() {
            Button('图文' + item)
              .type(ButtonType.Normal)
              .width('100%')
              .height('100%')
              .borderRadius(5)
          }
          .rowStart(0)
          .rowEnd(0)
          .columnStart(0)
          .columnEnd(1)
        }
        if (index > 3) {
          GridItem() {
            Button('图文' + item)
              .type(ButtonType.Normal)
              .width('100%')
              .height('100%')
              .borderRadius(5)
          }
          .rowStart(0)
          .rowEnd(0)
          .columnStart(0)
          .columnEnd(0)
        }
      })
    }
    .width('100%')
    .height(200)
    // 设置网格布局几行几列 3行4列
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr 1fr')
    // 设置行列之间 每个元素的间距
    .rowsGap(5)
    .columnsGap(5)
    .border({ width: 1, color: '#000' })
  }
}

export default MyGrid