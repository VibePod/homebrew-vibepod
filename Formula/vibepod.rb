class Vibepod < Formula
  include Language::Python::Virtualenv

  desc "Run and switch AI coding agents locally"
  homepage "https://vibepod.dev"
  url "https://files.pythonhosted.org/packages/source/v/vibepod/vibepod-0.9.1.tar.gz"
  sha256 "cd85c1694de0db37e3d8b35076d57676d16aa9b99799797c09ac8f3789340bef"
  license "MIT"

  depends_on "python@3.12"

  # Auto-generate these resource blocks by running:
  #   brew update-python-resources Formula/vibepod.rb
  #
  # Example of what generated resources look like:
  #
  # resource "click" do
  #   url "https://files.pythonhosted.org/packages/.../click-8.1.7.tar.gz"
  #   sha256 "..."
  # end
  #
  # resource "docker" do
  #   url "https://files.pythonhosted.org/packages/.../docker-7.1.0.tar.gz"
  #   sha256 "..."
  # end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "VibePod CLI", shell_output("#{bin}/vp version")
  end
end
