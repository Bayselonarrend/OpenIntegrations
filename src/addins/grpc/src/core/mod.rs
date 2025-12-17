pub use common_core::getset;

use common_core::impl_raw_addin;
use crate::component::{AddIn, METHODS, PROPS, get_params_amount, cal_func};

impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);


