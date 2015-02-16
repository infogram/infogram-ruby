require 'helper'

describe 'Infogram' do
  let(:api_key) { 'nMECGhmHe9' }
  let(:api_secret) { 'da5xoLrCCx' }
  let(:client) { infogram_client(api_key, api_secret) }
  let(:ig_id) { 'd819d9b7-67fb-40ec-9400-d63cc209aea8' }
  let(:params) {
    {
      content: [
        {
          type: 'h1',
          text: 'Hello infogr.am'
        }
      ],
      theme_id:  45,
      publish: false,
      title: 'Hello'
    }
  }

  context 'Themes' do
    it 'should return themes list' do
      stub_get('themes').to_return(with_fixture('themes.json'))
      themes = client.themes.list
      expect(themes[0]['id']).to eq(61)
      expect(themes[1]['title']).to eq('Megaphone')
    end
  end

  context 'Infographics' do
    it 'GET infographics' do
      stub_get('infographics').to_return(with_fixture('infographics.json'))
      infographics = client.infographics.list
      expect(infographics[1]['id']).to eq(ig_id)
    end

    it 'GET infographics/:id' do
      stub_get('infographics').to_return(with_fixture('infographic.json'))
      infographic = client.infographics.get(ig_id)
      expect(infographic['title']).to eq('sample infographic 2')
    end

    it 'POST infographics' do
      stub_post('infographics').to_return(with_fixture('infographic.json'))
      infographic = client.infographics.create(params)
      expect(infographic['title']).to eq('sample infographic 2')
    end
  end

  context 'Users' do
    it 'GET Users infographics' do
      stub_get('users').to_return(with_fixture('infographics.json'))
      infographics = client.users.get_infographics('abc')
      expect(infographics[1]['id']).to eq(ig_id)
    end
  end
end
