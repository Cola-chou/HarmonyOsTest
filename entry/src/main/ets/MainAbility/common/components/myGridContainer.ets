@Component
struct MyGridContainer {
  build() {
    GridContainer({
      columns: 12,
      gutter: 5, // 相邻间距
      margin: 0
    }) {
        Column({space:5}){
          Row({space:5}) {
            Button('图文')
              .type(ButtonType.Normal)
              .borderRadius(5)
              .height(85)
              .useSizeType({ // 选择尺寸 sm小型设备
                sm: { span: 6, offset: 0 } ,// span 宽度 offset 偏移量
                md:{span:4,offset:0}
              })
            Column({space:5}) {
              Row() {
                Button('图文')
                  .type(ButtonType.Normal)
                  .borderRadius(5)
                  .useSizeType({ // 选择尺寸 sm小型设备
                    sm: { span: 3, offset: 0 },
                    md:{span:4,offset:0}
                  })
                Button('图文')
                  .type(ButtonType.Normal)
                  .borderRadius(5)
                  .useSizeType({ // 选择尺寸 sm小型设备
                    sm: { span: 3, offset: 3 },
                    md:{span:4,offset:4}
                  })
              }

              Button('图文')
                .type(ButtonType.Normal)
                .borderRadius(5)
                .useSizeType({ // 选择尺寸 sm小型设备
                  sm: { span: 6, offset: 0 },
                  md:{span:8,offset:0}
                })
            }
          }
          Row(){
            Button('图文')
              .type(ButtonType.Normal)
              .borderRadius(5)
              .useSizeType({ // 选择尺寸 sm小型设备
                sm: { span: 3, offset: 0 },
                md:{span:3,offset:0}
              })
            Button('图文')
              .type(ButtonType.Normal)
              .borderRadius(5)
              .useSizeType({ // 选择尺寸 sm小型设备
                sm: { span: 3, offset: 3 },
                md:{span:3,offset:3}
              })
            Button('图文')
              .type(ButtonType.Normal)
              .borderRadius(5)
              .useSizeType({ // 选择尺寸 sm小型设备
                sm: { span: 3, offset: 6 },
                md:{span:3,offset:6}
              })
            Button('图文')
              .type(ButtonType.Normal)
              .borderRadius(5)
              .useSizeType({ // 选择尺寸 sm小型设备
                sm: { span: 3, offset: 9 },
                md:{span:3,offset:9}
              })
          }
        }
    }
    .width('100%')
//    .border({ width: 1 })
  }
}

export default MyGridContainer