﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InstaMelody.Business.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "12.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("23")]
        public int SaltLength {
            get {
                return ((int)(this["SaltLength"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("8")]
        public int TempPasswordLength {
            get {
                return ((int)(this["TempPasswordLength"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("6")]
        public int MaxFailedLogins {
            get {
                return ((int)(this["MaxFailedLogins"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("9126a407-41c5-461c-b164-1907af04c9d2")]
        public global::System.Guid AdminAccessToken {
            get {
                return ((global::System.Guid)(this["AdminAccessToken"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("10")]
        public int MinutesFileUploadTokenIsActive {
            get {
                return ((int)(this["MinutesFileUploadTokenIsActive"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Uploads")]
        public string BaseFileUploadFolder {
            get {
                return ((string)(this["BaseFileUploadFolder"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Melodies")]
        public string AudioFileUploadFolder {
            get {
                return ((string)(this["AudioFileUploadFolder"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Images")]
        public string ImageFileUploadFolder {
            get {
                return ((string)(this["ImageFileUploadFolder"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Videos")]
        public string VideoFileUploadFolder {
            get {
                return ((string)(this["VideoFileUploadFolder"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("True")]
        public bool UsersCanOnlyMessageFriends {
            get {
                return ((bool)(this["UsersCanOnlyMessageFriends"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Unknown")]
        public global::InstaMelody.Model.Enums.LoopEffectsEnum LoopPartStartEffect {
            get {
                return ((global::InstaMelody.Model.Enums.LoopEffectsEnum)(this["LoopPartStartEffect"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("00:00:00")]
        public global::System.TimeSpan LoopPartStartEffectDuration {
            get {
                return ((global::System.TimeSpan)(this["LoopPartStartEffectDuration"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Unknown")]
        public global::InstaMelody.Model.Enums.LoopEffectsEnum LoopPartEndEffect {
            get {
                return ((global::InstaMelody.Model.Enums.LoopEffectsEnum)(this["LoopPartEndEffect"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("00:00:00")]
        public global::System.TimeSpan LoopPartEndEffectDuration {
            get {
                return ((global::System.TimeSpan)(this["LoopPartEndEffectDuration"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Unknown")]
        public global::InstaMelody.Model.Enums.LoopEffectsEnum LoopPartFirstStartEffect {
            get {
                return ((global::InstaMelody.Model.Enums.LoopEffectsEnum)(this["LoopPartFirstStartEffect"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("00:00:00")]
        public global::System.TimeSpan LoopPartFirstStartDuration {
            get {
                return ((global::System.TimeSpan)(this["LoopPartFirstStartDuration"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("104.130.230.164")]
        public string SMTPMailHost {
            get {
                return ((string)(this["SMTPMailHost"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("DevAPNSCert.p12")]
        public string APNSDevCertificate {
            get {
                return ((string)(this["APNSDevCertificate"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("DevAPNSCert.p12")]
        public string APNSProdCertificate {
            get {
                return ((string)(this["APNSProdCertificate"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("instamelody")]
        public string APNSDevCertPassword {
            get {
                return ((string)(this["APNSDevCertPassword"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("instamelody")]
        public string APNSProdCertPassword {
            get {
                return ((string)(this["APNSProdCertPassword"]));
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("50")]
        public int DefaultStationGetLimit {
            get {
                return ((int)(this["DefaultStationGetLimit"]));
            }
            set {
                this["DefaultStationGetLimit"] = value;
            }
        }
    }
}
