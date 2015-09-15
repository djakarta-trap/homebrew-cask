cask :v1 => 'intellij-idea' do
  version '13.1.6’
  sha256 '211b8a146870bbf1ac20a0498a49863dbbc1f06989a4780c602ba115a9c0a943'

  url "https://download.jetbrains.com/idea/ideaIU-#{version}.dmg"
  name 'IntelliJ IDEA'
  homepage 'https://www.jetbrains.com/idea/'
  license :commercial

  app 'IntelliJ IDEA 13.app'

  zap :delete => [
                  '~/Library/Application Support/IntelliJIdea13’,
                  '~/Library/Preferences/IntelliJIdea13’,
                  '~/Library/Preferences/com.jetbrains.intellij.plist',
                 ]

  caveats <<-EOS.undent
    #{token} requires Java 6 like any other IntelliJ-based IDE.
    You can install it with

      brew cask install caskroom/homebrew-versions/java6

    The vendor (JetBrains) doesn't support newer versions of Java (yet)
    due to several critical issues, see details at
    https://intellij-support.jetbrains.com/entries/27854363

    To use existing newer Java at your own risk,
    add JVMVersion=1.6+ to ~/Library/Preferences/IntelliJIdea14/idea.properties
  EOS
end
