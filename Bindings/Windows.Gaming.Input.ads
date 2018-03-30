--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.System;
limited with Windows.Devices.Power;
with Windows.Foundation.Collections;
limited with Windows.Gaming.Input.ForceFeedback;
limited with Windows.Devices.Haptics;
--------------------------------------------------------------------------------
package Windows.Gaming.Input is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ArcadeStickButtons is (
      None,
      StickUp,
      StickDown,
      StickLeft,
      StickRight,
      Action1,
      Action2,
      Action3,
      Action4,
      Action5,
      Action6,
      Special1,
      Special2
   );
   for ArcadeStickButtons use (
      None => 0,
      StickUp => 1,
      StickDown => 2,
      StickLeft => 4,
      StickRight => 8,
      Action1 => 16,
      Action2 => 32,
      Action3 => 64,
      Action4 => 128,
      Action5 => 256,
      Action6 => 512,
      Special1 => 1024,
      Special2 => 2048
   );
   for ArcadeStickButtons'Size use 32;
   
   type ArcadeStickButtons_Ptr is access ArcadeStickButtons;
   
   type FlightStickButtons is (
      None,
      FirePrimary,
      FireSecondary
   );
   for FlightStickButtons use (
      None => 0,
      FirePrimary => 1,
      FireSecondary => 2
   );
   for FlightStickButtons'Size use 32;
   
   type FlightStickButtons_Ptr is access FlightStickButtons;
   
   type GameControllerButtonLabel is (
      None,
      XboxBack,
      XboxStart,
      XboxMenu,
      XboxView,
      XboxUp,
      XboxDown,
      XboxLeft,
      XboxRight,
      XboxA,
      XboxB,
      XboxX,
      XboxY,
      XboxLeftBumper,
      XboxLeftTrigger,
      XboxLeftStickButton,
      XboxRightBumper,
      XboxRightTrigger,
      XboxRightStickButton,
      XboxPaddle1,
      XboxPaddle2,
      XboxPaddle3,
      XboxPaddle4,
      Mode,
      Select_x,
      Menu,
      View,
      Back,
      Start,
      Options,
      Share,
      Up,
      Down,
      Left,
      Right,
      LetterA,
      LetterB,
      LetterC,
      LetterL,
      LetterR,
      LetterX,
      LetterY,
      LetterZ,
      Cross,
      Circle,
      Square,
      Triangle,
      LeftBumper,
      LeftTrigger,
      LeftStickButton,
      Left1,
      Left2,
      Left3,
      RightBumper,
      RightTrigger,
      RightStickButton,
      Right1,
      Right2,
      Right3,
      Paddle1,
      Paddle2,
      Paddle3,
      Paddle4,
      Plus,
      Minus,
      DownLeftArrow,
      DialLeft,
      DialRight,
      Suspension
   );
   for GameControllerButtonLabel use (
      None => 0,
      XboxBack => 1,
      XboxStart => 2,
      XboxMenu => 3,
      XboxView => 4,
      XboxUp => 5,
      XboxDown => 6,
      XboxLeft => 7,
      XboxRight => 8,
      XboxA => 9,
      XboxB => 10,
      XboxX => 11,
      XboxY => 12,
      XboxLeftBumper => 13,
      XboxLeftTrigger => 14,
      XboxLeftStickButton => 15,
      XboxRightBumper => 16,
      XboxRightTrigger => 17,
      XboxRightStickButton => 18,
      XboxPaddle1 => 19,
      XboxPaddle2 => 20,
      XboxPaddle3 => 21,
      XboxPaddle4 => 22,
      Mode => 23,
      Select_x => 24,
      Menu => 25,
      View => 26,
      Back => 27,
      Start => 28,
      Options => 29,
      Share => 30,
      Up => 31,
      Down => 32,
      Left => 33,
      Right => 34,
      LetterA => 35,
      LetterB => 36,
      LetterC => 37,
      LetterL => 38,
      LetterR => 39,
      LetterX => 40,
      LetterY => 41,
      LetterZ => 42,
      Cross => 43,
      Circle => 44,
      Square => 45,
      Triangle => 46,
      LeftBumper => 47,
      LeftTrigger => 48,
      LeftStickButton => 49,
      Left1 => 50,
      Left2 => 51,
      Left3 => 52,
      RightBumper => 53,
      RightTrigger => 54,
      RightStickButton => 55,
      Right1 => 56,
      Right2 => 57,
      Right3 => 58,
      Paddle1 => 59,
      Paddle2 => 60,
      Paddle3 => 61,
      Paddle4 => 62,
      Plus => 63,
      Minus => 64,
      DownLeftArrow => 65,
      DialLeft => 66,
      DialRight => 67,
      Suspension => 68
   );
   for GameControllerButtonLabel'Size use 32;
   
   type GameControllerButtonLabel_Ptr is access GameControllerButtonLabel;
   
   type GameControllerSwitchKind is (
      TwoWay,
      FourWay,
      EightWay
   );
   for GameControllerSwitchKind use (
      TwoWay => 0,
      FourWay => 1,
      EightWay => 2
   );
   for GameControllerSwitchKind'Size use 32;
   
   type GameControllerSwitchKind_Ptr is access GameControllerSwitchKind;
   
   type GameControllerSwitchPosition is (
      Center,
      Up,
      UpRight,
      Right,
      DownRight,
      Down,
      DownLeft,
      Left,
      UpLeft
   );
   for GameControllerSwitchPosition use (
      Center => 0,
      Up => 1,
      UpRight => 2,
      Right => 3,
      DownRight => 4,
      Down => 5,
      DownLeft => 6,
      Left => 7,
      UpLeft => 8
   );
   for GameControllerSwitchPosition'Size use 32;
   
   type GameControllerSwitchPosition_Ptr is access GameControllerSwitchPosition;
   
   type GamepadButtons is (
      None,
      Menu,
      View,
      A,
      B,
      X,
      Y,
      DPadUp,
      DPadDown,
      DPadLeft,
      DPadRight,
      LeftShoulder,
      RightShoulder,
      LeftThumbstick,
      RightThumbstick,
      Paddle1,
      Paddle2,
      Paddle3,
      Paddle4
   );
   for GamepadButtons use (
      None => 0,
      Menu => 1,
      View => 2,
      A => 4,
      B => 8,
      X => 16,
      Y => 32,
      DPadUp => 64,
      DPadDown => 128,
      DPadLeft => 256,
      DPadRight => 512,
      LeftShoulder => 1024,
      RightShoulder => 2048,
      LeftThumbstick => 4096,
      RightThumbstick => 8192,
      Paddle1 => 16384,
      Paddle2 => 32768,
      Paddle3 => 65536,
      Paddle4 => 131072
   );
   for GamepadButtons'Size use 32;
   
   type GamepadButtons_Ptr is access GamepadButtons;
   
   type RacingWheelButtons is (
      None,
      PreviousGear,
      NextGear,
      DPadUp,
      DPadDown,
      DPadLeft,
      DPadRight,
      Button1,
      Button2,
      Button3,
      Button4,
      Button5,
      Button6,
      Button7,
      Button8,
      Button9,
      Button10,
      Button11,
      Button12,
      Button13,
      Button14,
      Button15,
      Button16
   );
   for RacingWheelButtons use (
      None => 0,
      PreviousGear => 1,
      NextGear => 2,
      DPadUp => 4,
      DPadDown => 8,
      DPadLeft => 16,
      DPadRight => 32,
      Button1 => 64,
      Button2 => 128,
      Button3 => 256,
      Button4 => 512,
      Button5 => 1024,
      Button6 => 2048,
      Button7 => 4096,
      Button8 => 8192,
      Button9 => 16384,
      Button10 => 32768,
      Button11 => 65536,
      Button12 => 131072,
      Button13 => 262144,
      Button14 => 524288,
      Button15 => 1048576,
      Button16 => 2097152
   );
   for RacingWheelButtons'Size use 32;
   
   type RacingWheelButtons_Ptr is access RacingWheelButtons;
   
   type RequiredUINavigationButtons is (
      None,
      Menu,
      View,
      Accept_x,
      Cancel,
      Up,
      Down,
      Left,
      Right
   );
   for RequiredUINavigationButtons use (
      None => 0,
      Menu => 1,
      View => 2,
      Accept_x => 4,
      Cancel => 8,
      Up => 16,
      Down => 32,
      Left => 64,
      Right => 128
   );
   for RequiredUINavigationButtons'Size use 32;
   
   type RequiredUINavigationButtons_Ptr is access RequiredUINavigationButtons;
   
   type OptionalUINavigationButtons is (
      None,
      Context1,
      Context2,
      Context3,
      Context4,
      PageUp,
      PageDown,
      PageLeft,
      PageRight,
      ScrollUp,
      ScrollDown,
      ScrollLeft,
      ScrollRight
   );
   for OptionalUINavigationButtons use (
      None => 0,
      Context1 => 1,
      Context2 => 2,
      Context3 => 4,
      Context4 => 8,
      PageUp => 16,
      PageDown => 32,
      PageLeft => 64,
      PageRight => 128,
      ScrollUp => 256,
      ScrollDown => 512,
      ScrollLeft => 1024,
      ScrollRight => 2048
   );
   for OptionalUINavigationButtons'Size use 32;
   
   type OptionalUINavigationButtons_Ptr is access OptionalUINavigationButtons;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ArcadeStickReading is record
      Timestamp : Windows.UInt64;
      Buttons : Windows.Gaming.Input.ArcadeStickButtons;
   end record;
   pragma Convention (C_Pass_By_Copy , ArcadeStickReading);
   
   type ArcadeStickReading_Ptr is access ArcadeStickReading;
   
   type FlightStickReading is record
      Timestamp : Windows.UInt64;
      Buttons : Windows.Gaming.Input.FlightStickButtons;
      HatSwitch : Windows.Gaming.Input.GameControllerSwitchPosition;
      Roll : Windows.Double;
      Pitch : Windows.Double;
      Yaw : Windows.Double;
      Throttle : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , FlightStickReading);
   
   type FlightStickReading_Ptr is access FlightStickReading;
   
   type GamepadReading is record
      Timestamp : Windows.UInt64;
      Buttons : Windows.Gaming.Input.GamepadButtons;
      LeftTrigger : Windows.Double;
      RightTrigger : Windows.Double;
      LeftThumbstickX : Windows.Double;
      LeftThumbstickY : Windows.Double;
      RightThumbstickX : Windows.Double;
      RightThumbstickY : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , GamepadReading);
   
   type GamepadReading_Ptr is access GamepadReading;
   
   type GamepadVibration is record
      LeftMotor : Windows.Double;
      RightMotor : Windows.Double;
      LeftTrigger : Windows.Double;
      RightTrigger : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , GamepadVibration);
   
   type GamepadVibration_Ptr is access GamepadVibration;
   
   type RacingWheelReading is record
      Timestamp : Windows.UInt64;
      Buttons : Windows.Gaming.Input.RacingWheelButtons;
      PatternShifterGear : Windows.Int32;
      Wheel : Windows.Double;
      Throttle : Windows.Double;
      Brake : Windows.Double;
      Clutch : Windows.Double;
      Handbrake : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , RacingWheelReading);
   
   type RacingWheelReading_Ptr is access RacingWheelReading;
   
   type UINavigationReading is record
      Timestamp : Windows.UInt64;
      RequiredButtons : Windows.Gaming.Input.RequiredUINavigationButtons;
      OptionalButtons : Windows.Gaming.Input.OptionalUINavigationButtons;
   end record;
   pragma Convention (C_Pass_By_Copy , UINavigationReading);
   
   type UINavigationReading_Ptr is access UINavigationReading;
   
   type GamingInputPreviewContract is null record;
   pragma Convention (C_Pass_By_Copy , GamingInputPreviewContract);
   
   type GamingInputPreviewContract_Ptr is access GamingInputPreviewContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGameController_add_HeadsetConnected_Interface;
   type TypedEventHandler_IGameController_add_HeadsetConnected is access all TypedEventHandler_IGameController_add_HeadsetConnected_Interface'Class;
   type TypedEventHandler_IGameController_add_HeadsetConnected_Ptr is access all TypedEventHandler_IGameController_add_HeadsetConnected;
   type TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface;
   type TypedEventHandler_IGameController_add_HeadsetDisconnected is access all TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface'Class;
   type TypedEventHandler_IGameController_add_HeadsetDisconnected_Ptr is access all TypedEventHandler_IGameController_add_HeadsetDisconnected;
   type TypedEventHandler_IGameController_add_UserChanged_Interface;
   type TypedEventHandler_IGameController_add_UserChanged is access all TypedEventHandler_IGameController_add_UserChanged_Interface'Class;
   type TypedEventHandler_IGameController_add_UserChanged_Ptr is access all TypedEventHandler_IGameController_add_UserChanged;
   type EventHandler_IArcadeStick_Interface;
   type EventHandler_IArcadeStick is access all EventHandler_IArcadeStick_Interface'Class;
   type EventHandler_IArcadeStick_Ptr is access all EventHandler_IArcadeStick;
   type EventHandler_IFlightStick_Interface;
   type EventHandler_IFlightStick is access all EventHandler_IFlightStick_Interface'Class;
   type EventHandler_IFlightStick_Ptr is access all EventHandler_IFlightStick;
   type EventHandler_IGamepad_Interface;
   type EventHandler_IGamepad is access all EventHandler_IGamepad_Interface'Class;
   type EventHandler_IGamepad_Ptr is access all EventHandler_IGamepad;
   type EventHandler_IRacingWheel_Interface;
   type EventHandler_IRacingWheel is access all EventHandler_IRacingWheel_Interface'Class;
   type EventHandler_IRacingWheel_Ptr is access all EventHandler_IRacingWheel;
   type EventHandler_IRawGameController_Interface;
   type EventHandler_IRawGameController is access all EventHandler_IRawGameController_Interface'Class;
   type EventHandler_IRawGameController_Ptr is access all EventHandler_IRawGameController;
   type EventHandler_IUINavigationController_Interface;
   type EventHandler_IUINavigationController is access all EventHandler_IUINavigationController_Interface'Class;
   type EventHandler_IUINavigationController_Ptr is access all EventHandler_IUINavigationController;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGameController_Interface;
   type IGameController is access all IGameController_Interface'Class;
   type IGameController_Ptr is access all IGameController;
   type IGameControllerBatteryInfo_Interface;
   type IGameControllerBatteryInfo is access all IGameControllerBatteryInfo_Interface'Class;
   type IGameControllerBatteryInfo_Ptr is access all IGameControllerBatteryInfo;
   type IArcadeStick_Interface;
   type IArcadeStick is access all IArcadeStick_Interface'Class;
   type IArcadeStick_Ptr is access all IArcadeStick;
   type IArcadeStickStatics_Interface;
   type IArcadeStickStatics is access all IArcadeStickStatics_Interface'Class;
   type IArcadeStickStatics_Ptr is access all IArcadeStickStatics;
   type IArcadeStickStatics2_Interface;
   type IArcadeStickStatics2 is access all IArcadeStickStatics2_Interface'Class;
   type IArcadeStickStatics2_Ptr is access all IArcadeStickStatics2;
   type IFlightStick_Interface;
   type IFlightStick is access all IFlightStick_Interface'Class;
   type IFlightStick_Ptr is access all IFlightStick;
   type IFlightStickStatics_Interface;
   type IFlightStickStatics is access all IFlightStickStatics_Interface'Class;
   type IFlightStickStatics_Ptr is access all IFlightStickStatics;
   type IGamepad_Interface;
   type IGamepad is access all IGamepad_Interface'Class;
   type IGamepad_Ptr is access all IGamepad;
   type IGamepad2_Interface;
   type IGamepad2 is access all IGamepad2_Interface'Class;
   type IGamepad2_Ptr is access all IGamepad2;
   type IGamepadStatics_Interface;
   type IGamepadStatics is access all IGamepadStatics_Interface'Class;
   type IGamepadStatics_Ptr is access all IGamepadStatics;
   type IGamepadStatics2_Interface;
   type IGamepadStatics2 is access all IGamepadStatics2_Interface'Class;
   type IGamepadStatics2_Ptr is access all IGamepadStatics2;
   type IHeadset_Interface;
   type IHeadset is access all IHeadset_Interface'Class;
   type IHeadset_Ptr is access all IHeadset;
   type IRacingWheel_Interface;
   type IRacingWheel is access all IRacingWheel_Interface'Class;
   type IRacingWheel_Ptr is access all IRacingWheel;
   type IRacingWheelStatics_Interface;
   type IRacingWheelStatics is access all IRacingWheelStatics_Interface'Class;
   type IRacingWheelStatics_Ptr is access all IRacingWheelStatics;
   type IRacingWheelStatics2_Interface;
   type IRacingWheelStatics2 is access all IRacingWheelStatics2_Interface'Class;
   type IRacingWheelStatics2_Ptr is access all IRacingWheelStatics2;
   type IRawGameController_Interface;
   type IRawGameController is access all IRawGameController_Interface'Class;
   type IRawGameController_Ptr is access all IRawGameController;
   type IRawGameController2_Interface;
   type IRawGameController2 is access all IRawGameController2_Interface'Class;
   type IRawGameController2_Ptr is access all IRawGameController2;
   type IRawGameControllerStatics_Interface;
   type IRawGameControllerStatics is access all IRawGameControllerStatics_Interface'Class;
   type IRawGameControllerStatics_Ptr is access all IRawGameControllerStatics;
   type IUINavigationController_Interface;
   type IUINavigationController is access all IUINavigationController_Interface'Class;
   type IUINavigationController_Ptr is access all IUINavigationController;
   type IUINavigationControllerStatics_Interface;
   type IUINavigationControllerStatics is access all IUINavigationControllerStatics_Interface'Class;
   type IUINavigationControllerStatics_Ptr is access all IUINavigationControllerStatics;
   type IUINavigationControllerStatics2_Interface;
   type IUINavigationControllerStatics2 is access all IUINavigationControllerStatics2_Interface'Class;
   type IUINavigationControllerStatics2_Ptr is access all IUINavigationControllerStatics2;
   type IIterator_IArcadeStick_Interface;
   type IIterator_IArcadeStick is access all IIterator_IArcadeStick_Interface'Class;
   type IIterator_IArcadeStick_Ptr is access all IIterator_IArcadeStick;
   type IIterable_IArcadeStick_Interface;
   type IIterable_IArcadeStick is access all IIterable_IArcadeStick_Interface'Class;
   type IIterable_IArcadeStick_Ptr is access all IIterable_IArcadeStick;
   type IVectorView_IArcadeStick_Interface;
   type IVectorView_IArcadeStick is access all IVectorView_IArcadeStick_Interface'Class;
   type IVectorView_IArcadeStick_Ptr is access all IVectorView_IArcadeStick;
   type IIterator_IFlightStick_Interface;
   type IIterator_IFlightStick is access all IIterator_IFlightStick_Interface'Class;
   type IIterator_IFlightStick_Ptr is access all IIterator_IFlightStick;
   type IIterable_IFlightStick_Interface;
   type IIterable_IFlightStick is access all IIterable_IFlightStick_Interface'Class;
   type IIterable_IFlightStick_Ptr is access all IIterable_IFlightStick;
   type IVectorView_IFlightStick_Interface;
   type IVectorView_IFlightStick is access all IVectorView_IFlightStick_Interface'Class;
   type IVectorView_IFlightStick_Ptr is access all IVectorView_IFlightStick;
   type IIterator_IGamepad_Interface;
   type IIterator_IGamepad is access all IIterator_IGamepad_Interface'Class;
   type IIterator_IGamepad_Ptr is access all IIterator_IGamepad;
   type IIterable_IGamepad_Interface;
   type IIterable_IGamepad is access all IIterable_IGamepad_Interface'Class;
   type IIterable_IGamepad_Ptr is access all IIterable_IGamepad;
   type IVectorView_IGamepad_Interface;
   type IVectorView_IGamepad is access all IVectorView_IGamepad_Interface'Class;
   type IVectorView_IGamepad_Ptr is access all IVectorView_IGamepad;
   type IIterator_IRacingWheel_Interface;
   type IIterator_IRacingWheel is access all IIterator_IRacingWheel_Interface'Class;
   type IIterator_IRacingWheel_Ptr is access all IIterator_IRacingWheel;
   type IIterable_IRacingWheel_Interface;
   type IIterable_IRacingWheel is access all IIterable_IRacingWheel_Interface'Class;
   type IIterable_IRacingWheel_Ptr is access all IIterable_IRacingWheel;
   type IVectorView_IRacingWheel_Interface;
   type IVectorView_IRacingWheel is access all IVectorView_IRacingWheel_Interface'Class;
   type IVectorView_IRacingWheel_Ptr is access all IVectorView_IRacingWheel;
   type IIterator_IRawGameController_Interface;
   type IIterator_IRawGameController is access all IIterator_IRawGameController_Interface'Class;
   type IIterator_IRawGameController_Ptr is access all IIterator_IRawGameController;
   type IIterable_IRawGameController_Interface;
   type IIterable_IRawGameController is access all IIterable_IRawGameController_Interface'Class;
   type IIterable_IRawGameController_Ptr is access all IIterable_IRawGameController;
   type IVectorView_IRawGameController_Interface;
   type IVectorView_IRawGameController is access all IVectorView_IRawGameController_Interface'Class;
   type IVectorView_IRawGameController_Ptr is access all IVectorView_IRawGameController;
   type IIterator_IUINavigationController_Interface;
   type IIterator_IUINavigationController is access all IIterator_IUINavigationController_Interface'Class;
   type IIterator_IUINavigationController_Ptr is access all IIterator_IUINavigationController;
   type IIterable_IUINavigationController_Interface;
   type IIterable_IUINavigationController is access all IIterable_IUINavigationController_Interface'Class;
   type IIterable_IUINavigationController_Ptr is access all IIterable_IUINavigationController;
   type IVectorView_IUINavigationController_Interface;
   type IVectorView_IUINavigationController is access all IVectorView_IUINavigationController_Interface'Class;
   type IVectorView_IUINavigationController_Ptr is access all IVectorView_IUINavigationController;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IGameController_Interface is interface and Windows.IInspectable_Interface;
   
   function add_HeadsetConnected
   (
      This       : access IGameController_Interface
      ; value : TypedEventHandler_IGameController_add_HeadsetConnected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HeadsetConnected
   (
      This       : access IGameController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_HeadsetDisconnected
   (
      This       : access IGameController_Interface
      ; value : TypedEventHandler_IGameController_add_HeadsetDisconnected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HeadsetDisconnected
   (
      This       : access IGameController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UserChanged
   (
      This       : access IGameController_Interface
      ; value : TypedEventHandler_IGameController_add_UserChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserChanged
   (
      This       : access IGameController_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Headset
   (
      This       : access IGameController_Interface
      ; RetVal : access Windows.Gaming.Input.IHeadset
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWireless
   (
      This       : access IGameController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IGameController_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameController : aliased constant Windows.IID := (464479522, 24420, 17093, (130, 103, 185, 254, 34, 21, 191, 189 ));
   
   ------------------------------------------------------------------------
   type IGameControllerBatteryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetBatteryReport
   (
      This       : access IGameControllerBatteryInfo_Interface
      ; RetVal : access Windows.Devices.Power.IBatteryReport
   )
   return Windows.HRESULT is abstract;
   
   IID_IGameControllerBatteryInfo : aliased constant Windows.IID := (3706504833, 14691, 19878, (149, 93, 85, 63, 59, 111, 97, 97 ));
   
   ------------------------------------------------------------------------
   type IArcadeStick_Interface is interface and Windows.IInspectable_Interface;
   
   function GetButtonLabel
   (
      This       : access IArcadeStick_Interface
      ; button : Windows.Gaming.Input.ArcadeStickButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IArcadeStick_Interface
      ; RetVal : access Windows.Gaming.Input.ArcadeStickReading
   )
   return Windows.HRESULT is abstract;
   
   IID_IArcadeStick : aliased constant Windows.IID := (2974438301, 48891, 19585, (128, 81, 21, 236, 243, 177, 48, 54 ));
   
   ------------------------------------------------------------------------
   type IArcadeStickStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ArcadeStickAdded
   (
      This       : access IArcadeStickStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IArcadeStick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ArcadeStickAdded
   (
      This       : access IArcadeStickStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ArcadeStickRemoved
   (
      This       : access IArcadeStickStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IArcadeStick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ArcadeStickRemoved
   (
      This       : access IArcadeStickStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ArcadeSticks
   (
      This       : access IArcadeStickStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IArcadeStick -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IArcadeStickStatics : aliased constant Windows.IID := (1547155656, 14257, 19160, (148, 88, 32, 15, 26, 48, 1, 142 ));
   
   ------------------------------------------------------------------------
   type IArcadeStickStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromGameController
   (
      This       : access IArcadeStickStatics2_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IArcadeStick
   )
   return Windows.HRESULT is abstract;
   
   IID_IArcadeStickStatics2 : aliased constant Windows.IID := (1387648836, 48006, 17498, (181, 156, 89, 111, 14, 42, 73, 223 ));
   
   ------------------------------------------------------------------------
   type IFlightStick_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HatSwitchKind
   (
      This       : access IFlightStick_Interface
      ; RetVal : access Windows.Gaming.Input.GameControllerSwitchKind
   )
   return Windows.HRESULT is abstract;
   
   function GetButtonLabel
   (
      This       : access IFlightStick_Interface
      ; button : Windows.Gaming.Input.FlightStickButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IFlightStick_Interface
      ; RetVal : access Windows.Gaming.Input.FlightStickReading
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlightStick : aliased constant Windows.IID := (3030564892, 47163, 17497, (161, 169, 151, 176, 60, 51, 218, 124 ));
   
   ------------------------------------------------------------------------
   type IFlightStickStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FlightStickAdded
   (
      This       : access IFlightStickStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IFlightStick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FlightStickAdded
   (
      This       : access IFlightStickStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FlightStickRemoved
   (
      This       : access IFlightStickStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IFlightStick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FlightStickRemoved
   (
      This       : access IFlightStickStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_FlightSticks
   (
      This       : access IFlightStickStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IFlightStick -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromGameController
   (
      This       : access IFlightStickStatics_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IFlightStick
   )
   return Windows.HRESULT is abstract;
   
   IID_IFlightStickStatics : aliased constant Windows.IID := (1427411530, 65228, 17246, (131, 220, 92, 236, 138, 24, 165, 32 ));
   
   ------------------------------------------------------------------------
   type IGamepad_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Vibration
   (
      This       : access IGamepad_Interface
      ; RetVal : access Windows.Gaming.Input.GamepadVibration
   )
   return Windows.HRESULT is abstract;
   
   function put_Vibration
   (
      This       : access IGamepad_Interface
      ; value : Windows.Gaming.Input.GamepadVibration
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IGamepad_Interface
      ; RetVal : access Windows.Gaming.Input.GamepadReading
   )
   return Windows.HRESULT is abstract;
   
   IID_IGamepad : aliased constant Windows.IID := (3162223676, 2665, 14595, (158, 157, 165, 15, 134, 164, 93, 229 ));
   
   ------------------------------------------------------------------------
   type IGamepad2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetButtonLabel
   (
      This       : access IGamepad2_Interface
      ; button : Windows.Gaming.Input.GamepadButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   IID_IGamepad2 : aliased constant Windows.IID := (1008110013, 22805, 16965, (176, 192, 200, 159, 174, 3, 8, 255 ));
   
   ------------------------------------------------------------------------
   type IGamepadStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_GamepadAdded
   (
      This       : access IGamepadStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IGamepad
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GamepadAdded
   (
      This       : access IGamepadStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GamepadRemoved
   (
      This       : access IGamepadStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IGamepad
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GamepadRemoved
   (
      This       : access IGamepadStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Gamepads
   (
      This       : access IGamepadStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IGamepad -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IGamepadStatics : aliased constant Windows.IID := (2344412457, 54428, 14825, (149, 96, 228, 125, 222, 150, 183, 200 ));
   
   ------------------------------------------------------------------------
   type IGamepadStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromGameController
   (
      This       : access IGamepadStatics2_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IGamepad
   )
   return Windows.HRESULT is abstract;
   
   IID_IGamepadStatics2 : aliased constant Windows.IID := (1114074565, 2134, 18372, (146, 19, 179, 149, 80, 76, 58, 60 ));
   
   ------------------------------------------------------------------------
   type IHeadset_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CaptureDeviceId
   (
      This       : access IHeadset_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderDeviceId
   (
      This       : access IHeadset_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IHeadset : aliased constant Windows.IID := (1070683887, 26917, 16296, (145, 129, 2, 156, 82, 35, 174, 59 ));
   
   ------------------------------------------------------------------------
   type IRacingWheel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasClutch
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasHandbrake
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasPatternShifter
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPatternShifterGear
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxWheelAngle
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_WheelMotor
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IForceFeedbackMotor
   )
   return Windows.HRESULT is abstract;
   
   function GetButtonLabel
   (
      This       : access IRacingWheel_Interface
      ; button : Windows.Gaming.Input.RacingWheelButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IRacingWheel_Interface
      ; RetVal : access Windows.Gaming.Input.RacingWheelReading
   )
   return Windows.HRESULT is abstract;
   
   IID_IRacingWheel : aliased constant Windows.IID := (4115031407, 57606, 19586, (169, 15, 85, 64, 18, 144, 75, 133 ));
   
   ------------------------------------------------------------------------
   type IRacingWheelStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_RacingWheelAdded
   (
      This       : access IRacingWheelStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IRacingWheel
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RacingWheelAdded
   (
      This       : access IRacingWheelStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RacingWheelRemoved
   (
      This       : access IRacingWheelStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IRacingWheel
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RacingWheelRemoved
   (
      This       : access IRacingWheelStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_RacingWheels
   (
      This       : access IRacingWheelStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IRacingWheel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IRacingWheelStatics : aliased constant Windows.IID := (985738453, 22555, 18742, (159, 148, 105, 241, 230, 81, 76, 125 ));
   
   ------------------------------------------------------------------------
   type IRacingWheelStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromGameController
   (
      This       : access IRacingWheelStatics2_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IRacingWheel
   )
   return Windows.HRESULT is abstract;
   
   IID_IRacingWheelStatics2 : aliased constant Windows.IID := (3865492650, 60925, 17187, (169, 246, 60, 56, 64, 72, 209, 237 ));
   
   ------------------------------------------------------------------------
   type IRawGameController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AxisCount
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ButtonCount
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ForceFeedbackMotors
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.Gaming.Input.ForceFeedback.IVectorView_IForceFeedbackMotor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareProductId
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareVendorId
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_SwitchCount
   (
      This       : access IRawGameController_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetButtonLabel
   (
      This       : access IRawGameController_Interface
      ; buttonIndex : Windows.Int32
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IRawGameController_Interface
      ; buttonArray : Windows.Boolean_Ptr
      ; switchArray : Windows.Gaming.Input.GameControllerSwitchPosition_Ptr
      ; axisArray : Windows.Double_Ptr
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetSwitchKind
   (
      This       : access IRawGameController_Interface
      ; switchIndex : Windows.Int32
      ; RetVal : access Windows.Gaming.Input.GameControllerSwitchKind
   )
   return Windows.HRESULT is abstract;
   
   IID_IRawGameController : aliased constant Windows.IID := (2091740561, 42977, 20337, (154, 120, 51, 233, 197, 223, 234, 98 ));
   
   ------------------------------------------------------------------------
   type IRawGameController2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SimpleHapticsControllers
   (
      This       : access IRawGameController2_Interface
      ; RetVal : access Windows.Devices.Haptics.IVectorView_ISimpleHapticsController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NonRoamableId
   (
      This       : access IRawGameController2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IRawGameController2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IRawGameController2 : aliased constant Windows.IID := (1136705589, 47987, 18262, (167, 135, 62, 214, 190, 166, 23, 189 ));
   
   ------------------------------------------------------------------------
   type IRawGameControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_RawGameControllerAdded
   (
      This       : access IRawGameControllerStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IRawGameController
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RawGameControllerAdded
   (
      This       : access IRawGameControllerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RawGameControllerRemoved
   (
      This       : access IRawGameControllerStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IRawGameController
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RawGameControllerRemoved
   (
      This       : access IRawGameControllerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_RawGameControllers
   (
      This       : access IRawGameControllerStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IRawGameController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromGameController
   (
      This       : access IRawGameControllerStatics_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IRawGameController
   )
   return Windows.HRESULT is abstract;
   
   IID_IRawGameControllerStatics : aliased constant Windows.IID := (3951888274, 59738, 19225, (175, 199, 10, 89, 248, 191, 117, 158 ));
   
   ------------------------------------------------------------------------
   type IUINavigationController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IUINavigationController_Interface
      ; RetVal : access Windows.Gaming.Input.UINavigationReading
   )
   return Windows.HRESULT is abstract;
   
   function GetOptionalButtonLabel
   (
      This       : access IUINavigationController_Interface
      ; button : Windows.Gaming.Input.OptionalUINavigationButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   function GetRequiredButtonLabel
   (
      This       : access IUINavigationController_Interface
      ; button : Windows.Gaming.Input.RequiredUINavigationButtons
      ; RetVal : access Windows.Gaming.Input.GameControllerButtonLabel
   )
   return Windows.HRESULT is abstract;
   
   IID_IUINavigationController : aliased constant Windows.IID := (3853447133, 62734, 19029, (140, 220, 211, 50, 41, 84, 129, 117 ));
   
   ------------------------------------------------------------------------
   type IUINavigationControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function add_UINavigationControllerAdded
   (
      This       : access IUINavigationControllerStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IUINavigationController
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UINavigationControllerAdded
   (
      This       : access IUINavigationControllerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UINavigationControllerRemoved
   (
      This       : access IUINavigationControllerStatics_Interface
      ; value : Windows.Gaming.Input.EventHandler_IUINavigationController
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UINavigationControllerRemoved
   (
      This       : access IUINavigationControllerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_UINavigationControllers
   (
      This       : access IUINavigationControllerStatics_Interface
      ; RetVal : access Windows.Gaming.Input.IVectorView_IUINavigationController -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUINavigationControllerStatics : aliased constant Windows.IID := (789877514, 63224, 19016, (141, 137, 148, 120, 108, 202, 12, 46 ));
   
   ------------------------------------------------------------------------
   type IUINavigationControllerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromGameController
   (
      This       : access IUINavigationControllerStatics2_Interface
      ; gameController : Windows.Gaming.Input.IGameController
      ; RetVal : access Windows.Gaming.Input.IUINavigationController
   )
   return Windows.HRESULT is abstract;
   
   IID_IUINavigationControllerStatics2 : aliased constant Windows.IID := (3771410659, 45579, 19211, (158, 212, 243, 213, 60, 236, 13, 228 ));
   
   ------------------------------------------------------------------------
   type IIterator_IArcadeStick_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IArcadeStick_Interface
      ; RetVal : access Windows.Gaming.Input.IArcadeStick
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IArcadeStick_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IArcadeStick_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IArcadeStick_Interface
      ; items : Windows.Gaming.Input.IArcadeStick_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IArcadeStick : aliased constant Windows.IID := (3540396463, 52381, 21217, (139, 31, 15, 250, 150, 41, 175, 238 ));
   
   ------------------------------------------------------------------------
   type IIterable_IArcadeStick_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IArcadeStick_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IArcadeStick
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IArcadeStick : aliased constant Windows.IID := (2474046551, 11685, 21578, (164, 9, 198, 54, 245, 216, 28, 53 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IArcadeStick_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IArcadeStick_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IArcadeStick
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IArcadeStick_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IArcadeStick_Interface
      ; value : Windows.Gaming.Input.IArcadeStick
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IArcadeStick_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IArcadeStick_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IArcadeStick : aliased constant Windows.IID := (3200962165, 53453, 23196, (132, 95, 114, 240, 133, 80, 60, 223 ));
   
   ------------------------------------------------------------------------
   type IIterator_IFlightStick_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IFlightStick_Interface
      ; RetVal : access Windows.Gaming.Input.IFlightStick
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IFlightStick_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IFlightStick_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IFlightStick_Interface
      ; items : Windows.Gaming.Input.IFlightStick_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IFlightStick : aliased constant Windows.IID := (4126808345, 16152, 21856, (187, 19, 207, 112, 24, 172, 65, 213 ));
   
   ------------------------------------------------------------------------
   type IIterable_IFlightStick_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IFlightStick_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IFlightStick
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IFlightStick : aliased constant Windows.IID := (998228341, 48830, 21231, (163, 233, 221, 167, 94, 161, 172, 252 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IFlightStick_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IFlightStick_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IFlightStick
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IFlightStick_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IFlightStick_Interface
      ; value : Windows.Gaming.Input.IFlightStick
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IFlightStick_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IFlightStick_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IFlightStick : aliased constant Windows.IID := (2342323838, 46837, 22831, (169, 10, 215, 44, 61, 152, 212, 218 ));
   
   ------------------------------------------------------------------------
   type IIterator_IGamepad_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGamepad_Interface
      ; RetVal : access Windows.Gaming.Input.IGamepad
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGamepad_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGamepad_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGamepad_Interface
      ; items : Windows.Gaming.Input.IGamepad_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IGamepad : aliased constant Windows.IID := (610744296, 4796, 23652, (175, 82, 6, 219, 75, 19, 250, 47 ));
   
   ------------------------------------------------------------------------
   type IIterable_IGamepad_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGamepad_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IGamepad
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IGamepad : aliased constant Windows.IID := (1192438688, 27415, 23762, (168, 189, 181, 211, 68, 60, 203, 19 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IGamepad_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGamepad_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IGamepad
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGamepad_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGamepad_Interface
      ; value : Windows.Gaming.Input.IGamepad
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGamepad_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IGamepad_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IGamepad : aliased constant Windows.IID := (3952589673, 2505, 23193, (134, 178, 62, 54, 8, 82, 132, 212 ));
   
   ------------------------------------------------------------------------
   type IIterator_IRacingWheel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRacingWheel_Interface
      ; RetVal : access Windows.Gaming.Input.IRacingWheel
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRacingWheel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRacingWheel_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRacingWheel_Interface
      ; items : Windows.Gaming.Input.IRacingWheel_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IRacingWheel : aliased constant Windows.IID := (601306552, 19766, 21367, (162, 69, 105, 223, 151, 201, 252, 217 ));
   
   ------------------------------------------------------------------------
   type IIterable_IRacingWheel_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRacingWheel_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IRacingWheel
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IRacingWheel : aliased constant Windows.IID := (2591832112, 39559, 21127, (161, 226, 138, 42, 242, 156, 246, 140 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IRacingWheel_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRacingWheel_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IRacingWheel
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRacingWheel_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRacingWheel_Interface
      ; value : Windows.Gaming.Input.IRacingWheel
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRacingWheel_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IRacingWheel_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IRacingWheel : aliased constant Windows.IID := (356094898, 24658, 22873, (145, 236, 144, 12, 83, 254, 241, 32 ));
   
   ------------------------------------------------------------------------
   type IIterator_IRawGameController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRawGameController_Interface
      ; RetVal : access Windows.Gaming.Input.IRawGameController
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRawGameController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRawGameController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRawGameController_Interface
      ; items : Windows.Gaming.Input.IRawGameController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IRawGameController : aliased constant Windows.IID := (1372358876, 26363, 21994, (154, 27, 170, 220, 215, 28, 192, 142 ));
   
   ------------------------------------------------------------------------
   type IIterable_IRawGameController_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRawGameController_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IRawGameController
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IRawGameController : aliased constant Windows.IID := (2402224332, 62708, 21817, (147, 87, 31, 7, 51, 77, 56, 31 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IRawGameController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRawGameController_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IRawGameController
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRawGameController_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRawGameController_Interface
      ; value : Windows.Gaming.Input.IRawGameController
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRawGameController_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IRawGameController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IRawGameController : aliased constant Windows.IID := (2006762274, 16576, 21953, (141, 197, 204, 110, 58, 254, 2, 207 ));
   
   ------------------------------------------------------------------------
   type IIterator_IUINavigationController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IUINavigationController_Interface
      ; RetVal : access Windows.Gaming.Input.IUINavigationController
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IUINavigationController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IUINavigationController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IUINavigationController_Interface
      ; items : Windows.Gaming.Input.IUINavigationController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IUINavigationController : aliased constant Windows.IID := (3238733462, 25763, 21090, (188, 79, 183, 65, 229, 213, 175, 171 ));
   
   ------------------------------------------------------------------------
   type IIterable_IUINavigationController_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IUINavigationController_Interface
      ; RetVal : access Windows.Gaming.Input.IIterator_IUINavigationController
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IUINavigationController : aliased constant Windows.IID := (2380957088, 516, 22493, (171, 173, 144, 227, 124, 14, 242, 64 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IUINavigationController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IUINavigationController_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Gaming.Input.IUINavigationController
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IUINavigationController_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IUINavigationController_Interface
      ; value : Windows.Gaming.Input.IUINavigationController
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IUINavigationController_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Gaming.Input.IUINavigationController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IUINavigationController : aliased constant Windows.IID := (1749786202, 11714, 21756, (173, 245, 92, 168, 246, 135, 20, 37 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGameController_add_HeadsetConnected_Interface(Callback : access procedure (sender : Windows.Gaming.Input.IGameController ; args : Windows.Gaming.Input.IHeadset)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGameController_add_HeadsetConnected_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameController_add_HeadsetConnected_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.Gaming.Input.IHeadset
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGameController_add_HeadsetConnected : aliased constant Windows.IID := (129168055, 34853, 23630, (160, 82, 252, 254, 223, 58, 238, 161 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface(Callback : access procedure (sender : Windows.Gaming.Input.IGameController ; args : Windows.Gaming.Input.IHeadset)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.Gaming.Input.IHeadset
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGameController_add_HeadsetDisconnected : aliased constant Windows.IID := (129168055, 34853, 23630, (160, 82, 252, 254, 223, 58, 238, 161 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IGameController_add_UserChanged_Interface(Callback : access procedure (sender : Windows.Gaming.Input.IGameController ; args : Windows.System.IUserChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IGameController_add_UserChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameController_add_UserChanged_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IGameController_add_UserChanged : aliased constant Windows.IID := (3413458732, 12086, 23183, (173, 173, 5, 123, 234, 231, 58, 164 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IArcadeStick_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IArcadeStick)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IArcadeStick_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IArcadeStick_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IArcadeStick
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IArcadeStick : aliased constant Windows.IID := (1794867592, 53901, 21403, (187, 105, 234, 23, 99, 251, 153, 32 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IFlightStick_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IFlightStick)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IFlightStick_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IFlightStick_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IFlightStick
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IFlightStick : aliased constant Windows.IID := (3581178033, 52258, 23107, (142, 24, 92, 160, 100, 170, 254, 33 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IGamepad_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IGamepad)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IGamepad_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IGamepad_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IGamepad
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IGamepad : aliased constant Windows.IID := (2323003886, 25162, 20506, (187, 83, 86, 45, 30, 193, 27, 82 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IRacingWheel_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IRacingWheel)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IRacingWheel_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IRacingWheel_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IRacingWheel
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IRacingWheel : aliased constant Windows.IID := (892258340, 63051, 21331, (128, 234, 127, 245, 142, 59, 146, 164 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IRawGameController_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IRawGameController)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IRawGameController_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IRawGameController_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IRawGameController
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IRawGameController : aliased constant Windows.IID := (6429730, 17128, 21151, (146, 112, 131, 107, 50, 147, 29, 114 ));
   
   ------------------------------------------------------------------------
   type EventHandler_IUINavigationController_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Gaming.Input.IUINavigationController)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access EventHandler_IUINavigationController_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access EventHandler_IUINavigationController_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IUINavigationController
   )
   return Windows.HRESULT;
   
   IID_EventHandler_IUINavigationController : aliased constant Windows.IID := (2662253604, 30145, 22641, (141, 169, 206, 89, 12, 101, 48, 69 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Headset is Windows.Gaming.Input.IHeadset;
   subtype ArcadeStick is Windows.Gaming.Input.IArcadeStick;
   subtype FlightStick is Windows.Gaming.Input.IFlightStick;
   subtype Gamepad is Windows.Gaming.Input.IGamepad;
   subtype RacingWheel is Windows.Gaming.Input.IRacingWheel;
   subtype RawGameController is Windows.Gaming.Input.IRawGameController;
   subtype UINavigationController is Windows.Gaming.Input.IUINavigationController;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function add_ArcadeStickAdded
   (
      value : Windows.Gaming.Input.EventHandler_IArcadeStick
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ArcadeStickAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_ArcadeStickRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IArcadeStick
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ArcadeStickRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_ArcadeSticks
   return Windows.Gaming.Input.IVectorView_IArcadeStick;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IArcadeStick;
   
   function add_FlightStickAdded
   (
      value : Windows.Gaming.Input.EventHandler_IFlightStick
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_FlightStickAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_FlightStickRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IFlightStick
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_FlightStickRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_FlightSticks
   return Windows.Gaming.Input.IVectorView_IFlightStick;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IFlightStick;
   
   function add_GamepadAdded
   (
      value : Windows.Gaming.Input.EventHandler_IGamepad
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_GamepadAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_GamepadRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IGamepad
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_GamepadRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_Gamepads
   return Windows.Gaming.Input.IVectorView_IGamepad;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IGamepad;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IRacingWheel;
   
   function add_RacingWheelAdded
   (
      value : Windows.Gaming.Input.EventHandler_IRacingWheel
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RacingWheelAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_RacingWheelRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IRacingWheel
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RacingWheelRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_RacingWheels
   return Windows.Gaming.Input.IVectorView_IRacingWheel;
   
   function add_RawGameControllerAdded
   (
      value : Windows.Gaming.Input.EventHandler_IRawGameController
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RawGameControllerAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_RawGameControllerRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IRawGameController
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_RawGameControllerRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_RawGameControllers
   return Windows.Gaming.Input.IVectorView_IRawGameController;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IRawGameController;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IUINavigationController;
   
   function add_UINavigationControllerAdded
   (
      value : Windows.Gaming.Input.EventHandler_IUINavigationController
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_UINavigationControllerAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_UINavigationControllerRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IUINavigationController
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_UINavigationControllerRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_UINavigationControllers
   return Windows.Gaming.Input.IVectorView_IUINavigationController;

end;
