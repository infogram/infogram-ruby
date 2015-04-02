require 'infogram'

data = [
  ['apples', 'today', 'yesterday', 'd. bef. yesterday'],
  ['John', 4, 6, 7],
  ['Peter', 1, 3, 9],
  ['George', 4, 4, 3]
]

world_data = [
  {
    title: 'Japan',
    value: 126434964,
    label: 'Japan',
    group: 'A',
    color: '#ffo'
  },
  {
    title: 'United States',
    value: 318968000,
    label: 'USA',
    group: 'A',
    color: '#FF0000'
  }
]

params = {
  theme_id: 34,
  content: [
    {
      type: 'h2',
      text: 'H2 text'
    },
    {
      type: 'body',
      text: 'body text'
    },
    {
      type: 'quote',
      text: 'A person who never made a mistake never tried anything new.',
      title: 'Albert Einstein'
    },
    {
      type: 'chart',
      chart_type: 'bar',
      data: [data]
    },
    {
      type: 'chart',
      chart_type: 'column',
      data: [data]
    },
    {
      type: 'chart',
      chart_type: 'pie',
      data: [data]
    },
    {
      type: 'chart',
      chart_type: 'line',
      data: [data]
    },
    {
      type: 'map',
      territory: 'world',
      data: world_data
    }
  ],
  publish: false,
  title: '你好世界'
}

client = Infogram::Client.new('API_KEY', 'API_SECRET')
p client.infographics.create(params)
