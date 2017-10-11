<%@ Application Language="C#" %>
<%@ Import Namespace="DreamBird" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Quartz" %>
<%@ Import Namespace="Quartz.Impl" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);

        ////for start time at first run after 1 hour
        //DateTimeOffset startTime = DateBuilder.FutureDate(1, IntervalUnit.Hour);
        //IJobDetail job = JobBuilder.Create<EmailJob>()
        //                           .WithIdentity("job1")
        //                           .Build();
        //ITrigger trigger = TriggerBuilder.Create()
        //                                 .WithIdentity("trigger1")
        //                                 .StartAt(startTime)
        //                                 .WithSimpleSchedule(x => x.WithIntervalInSeconds(10).WithRepeatCount(2))
        //                                 .Build();
        //ISchedulerFactory sf = new StdSchedulerFactory();
        //IScheduler sc = sf.GetScheduler();
        //sc.ScheduleJob(job, trigger);
        //sc.Start();


    }
    public void Session_OnStart()
    {
        Session["timeStart"] = DateTime.Now;
    }
</script>
