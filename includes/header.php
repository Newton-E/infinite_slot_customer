<header class="shadow-sm">
        <!-- Topbar-->
        <div class="topbar topbar-dark bg-primary">
          <div class="container">
            <div>
              <div class="topbar-text dropdown disable-autohide"><a class="topbar-link dropdown-toggle" href="#" data-bs-toggle="dropdown"><img class="me-2" src="img/flags/ng.png" width="20" alt="Nigeria">Nig / ₦</a>
                <ul class="dropdown-menu my-1">
                  <li class="dropdown-item">
                    <select class="form-select form-select-sm">
                      <option value="usd">₦ NGN</option>
                    </select>
                  </li>
                  <li><a class="dropdown-item pb-1" href="#"><img class="me-2" src="img/flags/en.png" width="20" alt="Français">USA</a></li>
                  <li><a class="dropdown-item pb-1" href="#"><img class="me-2" src="img/flags/fr.png" width="20" alt="Français">Français</a></li>
                  <li><a class="dropdown-item pb-1" href="#"><img class="me-2" src="img/flags/de.png" width="20" alt="Deutsch">Deutsch</a></li>
                  <li><a class="dropdown-item" href="#"><img class="me-2" src="img/flags/it.png" width="20" alt="Italiano">Italiano</a></li>
                </ul>
              </div>
              <div class="topbar-text text-nowrap d-none d-md-inline-block border-start border-light ps-3 ms-3"><span class="text-muted me-1">Available 24/7 at</span><a class="topbar-link" href="tel:00331697720">(00) 33 169 7720</a></div>
            </div>
            <div class="topbar-text dropdown d-md-none ms-auto"><a class="topbar-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Wishlist / Compare / Track</a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="account-wishlist.php"><i class="ci-heart text-muted me-2"></i>Wishlist (3)</a></li>
                <li><a class="dropdown-item" href="comparison.html"><i class="ci-compare text-muted me-2"></i>Compare (3)</a></li>
                <li><a class="dropdown-item" href="order-tracking.html"><i class="ci-location text-muted me-2"></i>Order tracking</a></li>
              </ul>
            </div>
            <div class="d-none d-md-block ms-3 text-nowrap"><a class="topbar-link d-none d-md-inline-block" href="account-wishlist.php"><i class="ci-heart mt-n1"></i>Wishlist (3)</a><a class="topbar-link ms-3 ps-3 border-start border-light d-none d-md-inline-block" href="comparison.html"><i class="ci-compare mt-n1"></i>Compare (3)</a><a class="topbar-link ms-3 border-start border-light ps-3 d-none d-md-inline-block" href="order-tracking.html"><i class="ci-location mt-n1"></i>Order tracking</a></div>
          </div>
        </div>
        <!-- Remove "navbar-sticky" class to make navigation bar scrollable with the page.-->
        <div class="navbar-sticky bg-light">
          <div class="navbar navbar-expand-lg navbar-light">
            <div class="container"><a class="navbar-brand d-none d-sm-block me-3 flex-shrink-0" href="index.php"><img src="img/about/logo.png" width="100" alt="Infinite slot"></a><a class="navbar-brand d-sm-none me-2" href="index.html"><img src="img/about/logo.png" width="74" alt="Infinite slot"></a>
              <!-- Search-->
              <div class="input-group d-none d-lg-flex flex-nowrap mx-4"><i class="ci-search position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                <input class="form-control rounded-start w-100" type="text" placeholder="Search for products">
                <select class="form-select flex-shrink-0" style="width: 10.5rem;">
                  <option>All categories</option>
                  <option>Computers</option>
                  <option>Smartphones</option>
                  <option>TV, Video, Audio</option>
                  <option>Cameras</option>
                  <option>Headphones</option>
                  <option>Wearables</option>
                  <option>Printers</option>
                  <option>Video Games</option>
                  <option>Home Music</option>
                  <option>Data Storage</option>
                </select>
              </div>
              <!-- Toolbar-->
              <div class="navbar-toolbar d-flex flex-shrink-0 align-items-center">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"><span class="navbar-toggler-icon"></span></button><a class="navbar-tool navbar-stuck-toggler" href="#"><span class="navbar-tool-tooltip">Toggle menu</span>
                  <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-menu"></i></div></a><a class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2 btn_user_account" href="#" id="user_login_accout">
                  <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-user"></i></div>
                  <div class="navbar-tool-text ms-n3"><small id="user_infor"></small>My Account</div></a>
                <div class="navbar-tool dropdown ms-3"><a class="navbar-tool-icon-box bg-secondary dropdown-toggle" href="shop-cart.php"><span class="navbar-tool-label cart_count"></span><i class="navbar-tool-icon ci-cart"></i></a><a class="navbar-tool-text" href="shop-cart.php"><small>My Cart</small><span class="cart_price"></span></a>
                  <!-- Cart dropdown-->
                  <div class="dropdown-menu dropdown-menu-end">
                    <div class="widget widget-cart px-3 pt-2 pb-3" style="width: 20rem;" id="cart_details">
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar navbar-expand-lg navbar-light navbar-stuck-menu mt-n2 pt-0 pb-2">
            <div class="container">
              <div class="collapse navbar-collapse" id="navbarCollapse">
                <!-- Search-->
                <div class="input-group d-lg-none my-3"><i class="ci-search position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                  <input class="form-control rounded-start" type="text" placeholder="Search for products">
                </div>
                <!-- Departments menu-->
                <ul class="navbar-nav navbar-mega-nav pe-lg-2 me-lg-2">
                  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle ps-lg-0" href="#" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i class="ci-view-grid align-middle mt-n1 me-2"></i>Categories</a>
                    <ul class="dropdown-menu">
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-laptop opacity-60 fs-lg mt-n1 me-2"></i>Computers &amp; Accessories</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-sm-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Computers</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Laptops &amp; Tablets</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Desktop Computers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Computer External Components</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Computer Internal Components</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Networking Products (NAS)</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Single Board Computers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Desktop Barebones</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Accessories</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Monitors</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Bags, Cases &amp; Sleeves</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Batteries</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Charges &amp; Adapters</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cooling Pads</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Mounts</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Replacement Screens</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Security Locks</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Stands</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/07.jpg" alt="Computers &amp; Accessories"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$149.<small>80</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-mobile opacity-60 fs-lg mt-n1 me-2"></i>Smartphones &amp; Tablets</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links mb-3">
                                <h6 class="fs-base mb-3">Smartphones</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Apple iPhone</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Android Smartphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Phablets</a></li>
                                </ul>
                              </div>
                              <div class="widget widget-links">
                                <h6 class="fs-base">Tablets</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Apple iPad</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Android Tablets</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Tablets with Keyboard</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Accessories</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Accessory Kits</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Batteries &amp; Battery Packs</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cables</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Car Accessories</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Charges &amp; Power Adapters</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">FM Transmitters</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Lens Attachments</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Mounts &amp; Stands</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Repair Kits</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Replacement Parts</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Styluses</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/09.jpg" alt="Smartphones &amp; Tablets"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$127.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-monitor opacity-60 fs-lg mt-n1 me-2"></i>TV, Video &amp; Audio</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Television &amp; Video</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">TV Sets</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Home Theater Systems</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">DVD Players &amp; Recorders</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Blue-ray Players &amp; Recorders</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">HD DVD Players &amp; Recorders</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">DVD-VCR Combos</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">DTV Converters</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">AV Receivers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">AV Amplifiers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Projectors</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Projection Screens</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Satelite Television</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column pt-0 pb-4 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">TV-DTD Combos</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Sound Systems</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Home Cinema Systems</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Streaming Media Players</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">VCRs</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Video Glasses</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Lens Attachments</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/08.jpg" alt="TV, Video &amp; Audio"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$78.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-camera opacity-60 fs-lg mt-n1 me-2"></i>Cameras, Photo &amp; Video</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Cameras &amp; Lenses</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Point &amp; Shoot Digital Cameras</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">DSLR Cameras</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Mirrorless Cameras</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Body Mounted Cameras</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Camcorders</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Camcorder Lenses</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Camera Lenses</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Macro &amp; Ringlight Flashes</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Shoe Mount Flashes</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Tripods &amp; Monopods</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Video Studio</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Accessories</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Bags &amp; Cases</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Binoculars &amp; Scopes</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Batteries &amp; Chargers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cables &amp; Cords</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Camcorder Accessories</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cleaning Equipment</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Protector Foils</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Filters &amp; Accessories</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Remote Controls</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Rain Covers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Viewfinders</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/10.jpg" alt="Cameras, Photo &amp; Video"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$210.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-earphones opacity-60 fs-lg mt-n1 me-2"></i>Headphones</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Headphones</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Earbud Headphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Over-Ear Headphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">On-Ear Headphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Bluetooth Headphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Sports &amp; Fitness Headphones</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Noise-Cancelling Headphones</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Accessories</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cases &amp; Sleeves</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cables &amp; Cords</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Ear Pads</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Repair Kits</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Cleaning Equipment</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/11.jpg" alt="Headphones"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$35.<small>99</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-watch opacity-60 fs-lg mt-n1 me-2"></i>Wearable Electronics</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Gadgets</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Smartwatches</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Fitness Trackers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Smart Glasses</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Rings</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Virtual Reality</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Clips, Arm &amp; Wristbands</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Accessories</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/12.jpg" alt="Wearable Electronics"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$79.<small>50</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-printer opacity-60 fs-lg mt-n1 me-2"></i>Printers &amp; Ink</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links mb-3">
                                <h6 class="fs-base mb-3">By type</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">All-in-One</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Copying</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Faxing</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Photo Printing</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Printing Only</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Scanning</a></li>
                                </ul>
                              </div>
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Scanners</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Business Card Scanners</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Document Scanners</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Flatbed &amp; Photo Scanners</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Slide &amp; Negative Scanners</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base">Printers</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Dot Matrix Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Inkjet Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Label Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Laser Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Photo Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Wide Format Printers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Plotter Printers</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/13.jpg" alt="Printers &amp; Ink"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$54.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-joystick opacity-60 fs-lg mt-n1 me-2"></i>Video Games</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Games &amp; Hardware</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Video Games</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">PlayStation 4</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">PlayStation 3</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Xbox One</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Xbox 360</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Nintendo Switch</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Wii U</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Wii</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">PC</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Mac</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Nintendo 3DS &amp; 2DS</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Nintendo DS</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column pt-0 pb-4 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">PlayStation Vita</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Sony PSP</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Retro Gaming</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Microconsoles</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Accessories</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Digital Games</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/14.jpg" alt="Video Games"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$19.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-speaker opacity-60 fs-lg mt-n1 me-2"></i>Speakers &amp; Home Music</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column pt-4 pb-0 py-sm-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Speakers</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Bluetooth Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Bookshelf Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Ceiling &amp; In-Wall Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Center-Channel Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Floorstanding Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Outdoor Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Satellite Speakers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Sound Bars</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Subwoofers</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Surround Sound Systems</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Home Audio</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Home Theater</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Wireless &amp; Streaming Audio</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Stereo System Components</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Compact Radios &amp; Stereos</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Home Audio Accessories</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/16.jpg" alt="Speakers &amp; Home Music"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$43.<small>00</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li class="dropdown mega-dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="ci-server opacity-60 fs-lg mt-n1 me-2"></i>HDD/SSD Data Storage</a>
                        <div class="dropdown-menu p-0">
                          <div class="d-flex flex-wrap flex-md-nowrap px-2">
                            <div class="mega-dropdown-column py-4 px-3">
                              <div class="widget widget-links">
                                <h6 class="fs-base mb-3">Data Storage</h6>
                                <ul class="widget-list">
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">External Hard Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">External Solid State Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">External Zip Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Floppy &amp; Tape Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Internal Hard Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Internal Solid State Drives</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">Network Attached Storage</a></li>
                                  <li class="widget-list-item pb-1"><a class="widget-list-link" href="#">USB Flash Drives</a></li>
                                </ul>
                              </div>
                            </div>
                            <div class="mega-dropdown-column d-none d-lg-block py-4 text-center"><a class="d-block mb-2" href="#"><img src="img/shop/departments/15.jpg" alt="HDD/SSD Data Storage"></a>
                              <div class="fs-sm mb-3">Starting from <span class='fw-medium'>$21.<small>60</small></span></div><a class="btn btn-primary btn-shadow btn-sm" href="#">See offers<i class="ci-arrow-right fs-xs ms-1"></i></a>
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </li>
                </ul>
                <!-- Primary menu-->
                <ul class="navbar-nav">
                  <li class="nav-item active"><a class="nav-link" href="../retailers/index.php">Become a vendor</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="shop.php">Shop</a></li>
                  <li class="nav-item"><a class="nav-link" href="help-topics.html">Help Center</a></li>
                  <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                  <li class="nav-item"><a class="nav-link" href="contacts.html">Contacts</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </header>