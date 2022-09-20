// 文章模型封装
@Observed
class Article {
  title: string
  content: ContentItem[]

  constructor(option: {
    title: string,
    content: ContentItem[]
  }) {
    this.title = option.title
    this.content = option.content
  }
}

class ContentItem {
  content_index:number // 位标
  content_type: string // 内容类型 img/text
  content_data: string // 文本字符串/图片url
  constructor(option: {
    content_index:number
    content_type: string,
    content_data: string
  }) {
    this.content_index = option.content_index
    this.content_type = option.content_type
    this.content_data = option.content_data
  }
}

export { Article, ContentItem }