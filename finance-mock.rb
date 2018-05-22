class FinanceMock < Formula
  desc "finance-mock is a mock HTTP server that generates API responses. It can be used instead to make test suites faster and less brittle."
  homepage "https://github.com/piquette/finance-mock"
  url "https://github.com/piquette/finance-mock/releases/download/v0.0.2/finance-mock_0.0.2_darwin_amd64.tar.gz"
  version "0.0.2"
  sha256 "3bcf92d9dc4a1ddf4a410564f9fef1db63a0ceddf452bfea576ff02101e8b51a"

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
