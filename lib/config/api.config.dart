// ignore_for_file: constant_identifier_names

const String PROD_BASE_URL = 'https://atvarmart.in/api';

const String BASE_URL = PROD_BASE_URL;

// API ENDPOINTS

const String USER_URL = "$BASE_URL/";
const String LOGIN_URL = "$USER_URL/logic/login";
const String CREATEACCOUNT_URL = "$USER_URL/logic/register";
const String GET_ACCOUNT_URL = "$BASE_URL/view/customer-profile";


const String PRODUCT_VIEW_URL = "$BASE_URL/view/product";
const String HOME_BANNER_URL = "$BASE_URL/view/home-banner";
const String PRODUCT_DETAIL_URL = "$BASE_URL/view/product-single";
const String ADD_TO_CART_URL = "$BASE_URL/logic/add-to-cart";
const String CART_COUNT_URL = "$BASE_URL/view/cart-count";
const String CART_DETAILS_URL = "$BASE_URL/view/cart";
const String USER_DETAILS_URL = "$BASE_URL/view/customer-profile";
const String REMOVE_CART_ITEM_URL = "$BASE_URL/logic/remove-cart-item";
const String PLACE_ORDER_URL = "$BASE_URL/logic/finalize-order-cod";
const String CUSTOMER_ADDRESS_URL = "$BASE_URL/view/customer-address";
const String ORDERS_LIST_URL = "$BASE_URL/view/orders";
const String ORDERS_DETAIL_URL = "$BASE_URL/view/order-details";
