# debian has some issues with absent
# init scripts
class postfix::disable::debian inherits postfix::disable::base {
  Service['postfix']{
    hasstatus => false,
  }
}
