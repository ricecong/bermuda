//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bmd.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class BmdUser
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Type { get; set; }
        public string Pwd { get; set; }
        public string Avatar { get; set; }
        public Nullable<int> Rate { get; set; }
        public Nullable<long> FollowingCount { get; set; }
        public Nullable<long> FollowerCount { get; set; }
    }
}
