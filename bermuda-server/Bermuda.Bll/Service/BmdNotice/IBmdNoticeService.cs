﻿namespace Bermuda.Bll.Service
{
    using Model;

    public interface IBmdNoticeService : IBaseService<BmdNotice>
    {
        // add native methods here

        string ShowMsg();
    }
}