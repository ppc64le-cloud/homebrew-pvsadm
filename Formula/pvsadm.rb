class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.22"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.22/pvsadm-darwin-amd64.tar.gz"
      sha256 "76be2b20653f506a9df76ff93ad38a4ba8c5c2e7de1f546cc165fa8dec563864"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.22/pvsadm-darwin-arm64.tar.gz"
      sha256 "1213ea897d88076ca8fd7276e41c1620d1c31179ec711e46b57e7b4e11954ceb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.22/pvsadm-linux-amd64.tar.gz"
      sha256 "a31933dc7c8579f05cf14ac5cd054c5e9a53095dad16c403bb4e4ecc7a5eb662"
    end
  end

  def install
    bin.install "pvsadm"
  end

  test do
    output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
    assert_match "Error: --instance-name or --instance-name required", output
    assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version |  awk '{print $1, $2}'")
  end
end
