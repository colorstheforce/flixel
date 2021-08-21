import discord
from discord.ext import commands
from pretty_help import Navigation, PrettyHelp

from asyncio import sleep
import os
import random

bot = commands.Bot(command_prefix="$", description="Simple economy bot")
token = os.environ.get("token")

@bot.event
async def on_ready():
  print("I'm in")

  def run():
      bot.run(token)

if __name__ == "__main__":
  run()

  