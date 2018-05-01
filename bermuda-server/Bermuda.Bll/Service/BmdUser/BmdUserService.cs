﻿namespace Bermuda.Bll.Service
{
    using Dal.Dao;
    using Model;

    public class BmdUserService 
        : BaseService<BmdUser, IBmdUserDao>, IBmdUserService
    {
        public static string ShowMsg()
        {
            return idao.Show();
        }
    }
}
