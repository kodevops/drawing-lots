# Drawing Lots

고군분투기에서 발표자를 제비 뽑기하기 위해서, 특정 사이트에 후보자를 자동으로 입력 하고 추첨하는 툴.

![demo](/images/demo.gif)

## 환경 구축(사전 준비)

Mac을 기준으로 설명합니다.

- Homebrew
- Ruby 2.7.1
- Chrome driver
- Chrome

※ 주의: Chrome과Chrome driver의 버전을 맞춰 주세요.

```bash

# Homebrew 살치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# 크롬, 크롬 드라이브 살치
brew tap homebrew/cask
brew cask install google-chrome
brew cask install chromedriver

# 다양한 버젼의 ruby를 관리하기 위해서 rbenv를 설치 합니다.
brew install rbenv

# rbenv 커멘드를 사용 할수있도록 쉘 설정 추가 합니다.
# zsh를 쓰고 있는 사람은 .zshrc에 추가 해주세요.
export PATH="$HOME/.rbenv/bin:$PATH" >> ~/.bashrc
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi >> ~/.bashrc
source ~/.bashrc
```

## 실행

```bash
# ruby 설치
rbenv install

# 패키지 설치
bundle install --path vendor/bundle

# 후보자 파일 수정
vi candidates.txt

# 실행
bundle exec rspec spec/features/input.rb
```

## 결과 확인

```bash
open result.png
```

## 참고

- [RSpecとCapybaraを使ってE2Eテストの土台を作ってみる](https://qiita.com/takayamag/items/8bde23a90ea4fc3c42a7)
