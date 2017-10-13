module parameters_subfamily_mod

  implicit none

contains

  !================================================================================
  ! Chain rules declarations for log(par)
  function parameter_to_logarithm_of_parameter(param_in) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    param_out(:,:,:,:,:) = log(param_in(:,:,:,:,:))
  end function parameter_to_logarithm_of_parameter

  function gradient_for_logarithm_of_parameter(grad_in,param_in) result(grad_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: grad_in, param_in
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: grad_out
    grad_out(:,:,:,:,:) = grad_in(:,:,:,:,:) * param_in(:,:,:,:,:)
  end function gradient_of_logarithm_of_parameter
  
  function logarithm_of_parameter_to_parameter(param_in) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    param_out(:,:,:,:,:) = exp(param_in(:,:,:,:,:))
  end function logarithm_of_parameter_to_parameter
  !--------------------------------------------------------------------------------

  !================================================================================
  ! Chain rules declarations for par/par0
  function parameter_to_adimensional_parameter(param_in, param_ref) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    integer :: npar, ipar
    npar = size(param_in,1)
    do ipar = 1, npar 
       param_out(ipar,:,:,:,:) = param_in(ipar,:,:,:,:) / param_ref(ipar)
    end do
  end function parameter_to_adimensional_parameter

  function gradient_for_adimentional_parameter(grad_in, param_ref) result(grad_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: grad_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: grad_out
    integer :: npar, ipar
    npar = size(param_in,1)
    do ipar = 1, npar 
       grad_out(ipar,:,:,:,:) = grad_in(ipar,:,:,:,:) * param_ref(idim)
    end do
  end function gradient_for_adimentional_parameter

  function adimentional_parameter_to_parameter(param_in, param_ref) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    npar = size(param_in,1)
    do ipar = 1, npar 
       param_out(:,:,:,:,:) = param_in(:,:,:,:,:) / param_ref(idim)
    end do
  end function adimentional_parameter_to_parameter
  !--------------------------------------------------------------------------------

  !================================================================================
  ! Chain rule declaration for log(par/par0)r 
  function parameter_to_logarithm_of_adimensional_parameter(param_in, param_ref) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    integer :: npar, ipar
    npar = size(param_in,1)
    do ipar = 1, npar 
       param_out(ipar,:,:,:,:) = log(param_in(ipar,:,:,:,:) / param_ref(ipar))
    end do
  end function parameter_to_logarithm_of_adimensional_parameter

  function gradient_for_logarithm_of_adimensional_parameter(param_in, grad_in, param_ref) result(grad_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in, grad_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: grad_out
    integer :: npar, ipar
    npar = size(param_in,1)
    do ipar = 1, npar 
       param_out(ipar,:,:,:,:) = param_in(ipar,:,:,:,:) * param_ref(ipar) * grad_in(ipar,:,:,:,:)
    end do
  end function gradient_for_logarithm_of_adimensional_parameter

  function logarithm_of_adimentional_parameter_to_parameter(param_in, param_ref) result(param_out)
    real, dimension(:,:,:,:,:), allocatable, intent(in)  :: param_in
    real, dimension(:),         allocatable, intent(in)  :: param_ref
    real, dimension(:,:,:,:,:), allocatable, intent(out) :: param_out
    integer :: npar, ipar
    npar = size(param_in,1)
    do ipar = 1, npar 
       param_out(ipar,:,:,:,:) = exp(param_in(ipar,:,:,:,:)) * param_ref(ipar) 
    end do
  end function logarithm_of_adimentional_parameter_to_parameter
  !--------------------------------------------------------------------------------

end module parameters_subfamily_mod
