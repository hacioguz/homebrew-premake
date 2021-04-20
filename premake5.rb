class Premake5 < Formula
  desc "Premake is a simple build configuration system."
  homepage "https://premake.github.io/"
  url "https://github.com/premake/premake-core/releases/download/v5.0.0-alpha16/premake-5.0.0-alpha16-src.zip"
  sha256 "bd1c0944877cf1200a3c5499b893fef2d8af6df6e8b8645b8ba017d258019ba5"
  license "BSD-3-Clause"
  version_scheme 1
  head "https://github.com/premake/premake-core.git"

  conflicts_with "premake", :because => "both install premake4 or premake5"

  bottle :unneeded

  def install
    if build.head?
      system "make", "-f", "Bootstrap.mak", "osx"
      system "./premake5", "gmake"
    end

    system "make", "-C", "build/gmake.macosx"
    bin.install "bin/release/premake5"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/premake5 --version")
  end
end
