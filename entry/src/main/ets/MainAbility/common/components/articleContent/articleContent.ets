import { Article } from '../../model/Article';
import ContentItem_UI from '../articleContent/contentItem_ui'
// 基于文章模型的文章内容封装
@Component
struct ArticleContent {
  @Consume('articleContent') article: Article
  @State userClick: number = -1

  build() {
    Column() {
      ForEach(this.article.content, (item) => {
        ContentItem_UI({
          content_type: item.content_type,
          content_data: item.content_data,
          content_index: item.content_index,
          userClick:$userClick
        })
      })
    }
  }
}

export default ArticleContent