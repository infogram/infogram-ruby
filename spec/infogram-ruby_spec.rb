require 'helper'

describe 'Infogram' do
  let (:api_key) { 'nMECGhmHe9' }
  let (:api_secret) { 'da5xoLrCCx' }
  let (:client) { infogram_client(api_key, api_secret) }
  let (:params) { {
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

  context 'Signature' do
    let (:encoded_params) { 'api_key=nMECGhmHe9&content=%5B%7B%3Atype%3D%3E%22h1%22%2C%20%3Atext%3D%3E%22Hello%20infogr.am%22%7D%5D&publish=false&theme_id=45&title=Hello' }

    it 'should encode params' do
      params[:api_key] = api_key
      expect(client.decode_params(params)).to eq(encoded_params)
    end

    it 'should generate signature' do
      params[:api_key] = api_key
      signature = client.signature('post', 'infographics', params)
      expect(signature).to eq('FqGHS3wWJQQn7yxrwhLP5qCxhjQ=')
    end
  end

  context 'Themes' do
    it 'should return themes list' do
      stub_get('themes').to_return(with_fixture('themes.json'))
      themes = client.get_themes()
      expect(themes[0]['id']).to eq(61)
      expect(themes[1]['title']).to eq('Megaphone')
    end
  end

  context 'Infographic' do
    it 'GET infographics' do
      stub_get('infographics').to_return(with_fixture('infographics.json'))
      ig = client.get_infographics
      expect(ig[1]['id']).to eq('d819d9b7-67fb-40ec-9400-d63cc209aea8')
    end

    it 'GET infographics/:id' do
      stub_get('infographics').to_return(with_fixture('infographic.json'))
      ig = client.get_infographic('d819d9b7-67fb-40ec-9400-d63cc209aea8')
      expect(ig['title']).to eq('sample infographic 2')
    end

    it 'POST infographics' do
      stub_post('infographics').to_return(with_fixture('infographic.json'))
      ig = client.create_infographic(params)
      expect(ig['title']).to eq('sample infographic 2')
    end
  end
end
