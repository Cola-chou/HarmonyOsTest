//import MyGrid from '../common/components/myGrid'
import MyGridContainer from '../common/components/myGridContainer'
import ArticalItem from '../common/components/articalItem'
import display from '@ohos.display';

@Entry
@Component
struct Home {
  @State message: string = 'Hello Worldsdf'
  @State btnList: number[] = [
    1, 2, 3, 4, 5, 6, 7, 8
  ]
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State screen_width: number = 0
  @State screen_height: number = 0
  @State testImg: string = ''

  build() {
    Column() {
      Column() {
        //      MyGrid({btnList:$btnList})
        MyGridContainer()
        List({space:5}){
          ForEach(this.btnList,()=>{
            ListItem(){
              ArticalItem()
            }
          })
        }
        .width('100%')
        .height(this.screen_height - 10 - 85 - 5 - 40 - 20 )
//        .border({width:2,color:'#ff5f5f5f'})
        .margin({top:10,bottom:10})
      }.padding(10)

      if (this.screen_height == 0) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
            //          .border({ width: 0, color: '#ff0000' })
          .position({ x: 0, y: 0 })
          .onReady(() => {
            let testBase64 = this.context.toDataURL('image/jpeg', 0.1)
            console.info(testBase64)
            this.testImg = testBase64
          })
        Image(this.testImg)
          .onComplete((e) => { // .onComplete 加载完图片后会 callback 一些图片的信息：图片的宽，高
            console.info(JSON.stringify(e))
            this.screen_width = px2vp(e.width) //像素px转vp
            this.screen_height = px2vp(e.height)
            console.info(JSON.stringify(this.screen_width))
            console.info(JSON.stringify(this.screen_height))
          })
      }
    }
  }
}