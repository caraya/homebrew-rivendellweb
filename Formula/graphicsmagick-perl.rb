class GraphicsmagickPerl < Formula
  desc "Image processing tools collection"
  homepage "http://www.graphicsmagick.org/"
  url "https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.36/GraphicsMagick-1.3.36.tar.xz"
  sha256 "5d5b3fde759cdfc307aaf21df9ebd8c752e3f088bb051dd5df8aac7ba7338f46"
  head "http://hg.code.sf.net/p/graphicsmagick/code", using: :hg

  bottle do
    root_url "https://github.com/caraya/homebrew-rivendellweb/releases/download/graphicsmagick-perl-1.3.36"
    sha256 catalina:     "26f685e8ac20f33e7f784b20d02e89a92a2d649aa890228a57c7a08453191fed"
    sha256 x86_64_linux: "95298b8cdddfb225aa47d2073033446e5d9e7da762152975828da1e7989dca65"
  end

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "jasper"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "libtool"
  depends_on "little-cms2"
  depends_on "perl"
  depends_on "webp"

  uses_from_macos "bzip2"
  uses_from_macos "libxml2"
  uses_from_macos "zlib"

  conflicts_with "graphicsmagick", because: "both packages install the same binaries"

  skip_clean :la

  def install
    ENV["CFLAGS"]="-fPIC -DPIC"

    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --disable-openmp
      --disable-static
      --enable-shared
      --with-perl
      --with-modules
      --without-jbig
      --with-quantum-depth=16
      --without-lzma
      --without-x
      --without-gslib
      --with-gs-font-dir=#{HOMEBREW_PREFIX}/share/ghostscript/fonts
      --without-wmf
    ]

    # versioned stuff in main tree is pointless for us
    inreplace "configure", "${PACKAGE_NAME}-${PACKAGE_VERSION}", "${PACKAGE_NAME}"
    system "./configure", *args
    system "make", "install"
  end

  test do
    fixture = test_fixtures("test.png")
    assert_match "PNG 8x8+0+0", shell_output("#{bin}/gm identify #{fixture}")
  end
end
