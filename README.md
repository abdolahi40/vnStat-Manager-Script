# vnStat Manager Script

A professional and user-friendly **terminal menu script** for managing and monitoring network bandwidth using **vnStat 2.12** on Debian/Ubuntu systems.

<img width="414" height="519" alt="image" src="https://github.com/user-attachments/assets/82e2e370-dd69-4817-839a-2dc3138fefad" />

---

## Features

- Easy installation and uninstallation of vnStat
- View traffic reports for various time ranges:
  - Last 5 minutes
  - Hourly (with optional graph)
  - Daily, Monthly, Yearly
  - Top traffic days
  - Custom date range reports
- Live real-time traffic monitoring
- List and select network interfaces for detailed reports
- Force manual database updates for vnStat
- Option to install the script as a system-wide command (`vnstatscript`) for quick future access
- Colorful and well-organized menu with clear separation of options
- Designed for ease of use and clarity in terminal environments

---

## Requirements

- Debian-based Linux distribution (Ubuntu, Debian, etc.)
- `vnstat` installed (can be installed via the script)
- `curl` installed for script installation feature
- `bash` shell

---

## Installation and Usage

You can run the script directly without installation:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/abdolahi40/vnStat-Manager-Script/master/vnstat-manager.sh)
```

Once running, use the menu options to install vnStat, view reports, or manage the tool.
Install as a command

To install this script as a command for easy future use, choose the menu option:

2) Install This Script as 'vnstatscript' Command

This will save the script to /usr/local/bin/vnstatscript and make it executable.

After installation, simply run:

vnstatscript

to launch the menu anytime.
How to Use

    Run the script as shown above.

    Select the desired menu option by typing its number and pressing Enter.

    For live monitoring and reports, follow on-screen instructions.

    Use the Custom Date Range Report to specify start and end dates in YYYY-MM-DD format.

    When updating the database or uninstalling, the script will prompt for confirmation.

Configuration Notes

    vnStat update interval is configured in /etc/vnstat.conf under the UpdateInterval setting.

    Default update interval is usually 5 minutes (300 seconds).

    You can change this setting manually if needed.

Troubleshooting

    Make sure you run the script with appropriate permissions (use sudo if necessary).

    Network interfaces names vary; use the menu option to list interfaces if unsure.

    For real-time monitoring, press Ctrl+C to exit live view.


License

    This script is open source and free to use under the MIT License.


vnStat Manager Script!
