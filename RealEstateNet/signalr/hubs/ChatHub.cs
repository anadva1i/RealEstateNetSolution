using Microsoft.AspNet.SignalR;
using RealEstateNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
namespace RealEstateNet.signalr.hubs
{
    public class ChatHub : Hub
    {
        public void Join(string chatId)
        {
            Groups.Add(Context.ConnectionId, "chat"+chatId);
        }
        public void Send(string message, string chatId, string from)
        {
            DateTime now = DateTime.Now;
            Clients.Group("chat"+chatId).addNewMessageToPage(now.ToString(), message, from);    
        }
    }
}