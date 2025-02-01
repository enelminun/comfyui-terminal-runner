# Maintainer : enelminun (github)
pkgname=comfyuirun
pkgver=1.0
pkgrel=1
pkgdesc="Script to run ComfyUI easily"
arch=('any')
url="https://github.com/enelminun/enelminun/comfyui-terminal-runner"
license=('GPL3')
depends=('python' 'bash')
source=("$pkgname.sh")
md5sums=('SKIP')  # Dosya indirilmeyeceği için SKIP

package() {
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
