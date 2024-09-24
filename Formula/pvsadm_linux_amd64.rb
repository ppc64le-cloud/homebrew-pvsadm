class PvsadmLinuxAmd64 < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.11/pvsadm-linux-amd64.tar.gz"
  version "0.1.11"
  sha256 "b25e9453bdd75a11af3303783c250c93f05b3472cfe49e795bab200e5db04e03"
  license "Apache-2.0"

  def install
    bin.install "pvsadm"
  end

  test do
    output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
    assert_match "Error: --instance-name or --instance-name required", output
    assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version | awk '{print $1, $2}'")
  end
end
