require 'spec_helper.rb'

describe '[제비뽑기 후보자 자동입력]' do

  before(:each) do
    visit 'https://prevl.org/service/dist/random-picker/'
  end

  it '후보자 입력' do
    # 후보자 리스트를 읽어서 등록하기
    File.foreach('candidates.txt') do |candidate|
      if !candidate.empty?
        fill_in 'selector-input', with: candidate
        click_button 'add-target-button'
      end
    end

    # 후보자 추첨 시작
    click_button '추첨하기'

    # 당첨자를 몇명으로 할지 인원수 설정
    fill_in 'total-picker-input', with: '2'

    # 결과 확인 시작
    click_button 'start-pickup-button'

    # 결과 확인후 사진 저장.
    # 주의: 10분후에 브라우저가 닫힘.
    within '#result-modal' do
      page.save_screenshot("result.png", full: true)
      expect(page).to have_content("추첨결과")
      sleep 600 # 10분간 브라우저가 자동으로 닫히지 않도록 유지
    end

  end
end
