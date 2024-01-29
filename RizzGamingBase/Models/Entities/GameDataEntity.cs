﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RizzGamingBase.Models.Entity
{
	public class GameDataEntity
	{
		public int Id { get; set; }
		public string GameName { get; set; }
		public DateTime TransactionDate { get; set; }
		public decimal Amount { get; set; }
	}
}