class FinanceMock < Formula
  desc "finance-mock is a mock HTTP server that generates API responses. It can be used instead to make test suites faster and less brittle."
  homepage "https://github.com/piquette/finance-mock"
  url "https://github.com/piquette/finance-mock/releases/download/v0.0.4/finance-mock_0.0.4_darwin_amd64.tar.gz"
  version "0.0.4"
  sha256 "32b0945b1ee75d5e4424ee313f5a5ec0aab59cd1a76f9f3c5fab553c1629d9ce"

  def install
    bin.install "finance-mock"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{opt_bin}/finance-mock</string>
      <string>-port</string>
      <string>12111</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/finance-mock.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/finance-mock.log</string>
  </dict>
</plist>

  EOS
  end
end
