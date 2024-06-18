---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Watch-URLScan

## SYNOPSIS
This function enables you to get a live feed of scans from URLScan.io

## SYNTAX

```
Watch-URLScan [[-BreakAfter] <Int32>] [[-Interval] <Int32>]
```

## DESCRIPTION
This function enables you to get a live feed of scans from URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
Watch-URLScan -BreakAfter 15

id                                   time                 ip                url
--                                   ----                 --                ---
bb8244c2-c991-4a50-a695-1a4c60a82da3 6/18/2024 6:25:46 AM 188.114.96.3      https://margapetir.site/
16455213-0a13-4106-a12a-1444900a7756 6/18/2024 6:25:43 AM 188.114.97.3      https://www.idpagar.xyz/
f27b6dfc-99c0-4dcf-8806-48fc717d76bd 6/18/2024 6:25:43 AM 3.33.130.190      https://darkscan.io/lander
7bf7e05b-cb48-4150-ada4-d0e0fcfe780f 6/18/2024 6:25:43 AM 64.31.22.58       https://quicktravlesltd.co.uk/
34e74a9f-0323-4a1e-9c4f-df31c4ba863e 6/18/2024 6:25:42 AM 3.220.57.224      https://academy.titansofcnc.com/
f8f8f44f-ba89-4bbf-bb42-c9b00a6cbddd 6/18/2024 6:25:42 AM 80.74.145.103     https://isler-wirth.ch/
c7c0f6b0-5d2d-4ea8-b8cb-c2219eb4188e 6/18/2024 6:25:42 AM 103.110.127.102   https://ipv4.digihimanshumarketer.in/
5e73f019-5d26-4cee-baaf-25dc37afdb15 6/18/2024 6:25:42 AM 172.67.186.138    https://frenchpolynesiacruises.today/
29886776-cd96-4fa4-9393-6555ab13f099 6/18/2024 6:25:42 AM 2620:1ec:29:1::67 https://www.359951.cc/
5fe3d683-7549-4eb3-b8f0-66052ef0a7af 6/18/2024 6:25:42 AM 23.227.38.65      https://shapify.in/
b6c47638-6743-416d-91eb-51b8a73d9c96 6/18/2024 6:25:42 AM 23.224.131.131    https://dydouyin88.online/
15a8163d-6523-4d34-9cda-fcf2984e8ed6 6/18/2024 6:25:42 AM 188.114.96.3      https://panen889jepeh02.co/
70802a8f-9bba-40ed-be48-c601ee89a020 6/18/2024 6:25:41 AM 50.56.167.254     https://www.aitoday.io/webinars/live-webinar-special-…
95e74b75-2bd4-4381-b416-5d185e9bc5a7 6/18/2024 6:25:41 AM 185.215.4.45      https://deliverypay.ru/
063ece1b-266a-4a78-a049-f45820c7aafe 6/18/2024 6:25:40 AM 88.99.101.219     https://francescamariacarta.altervista.org/
```

## PARAMETERS

### -BreakAfter
Use the -BreakAfter parameter to set how many results are returned.
By default this is infinite and requires you to CTRL+C to exit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Interval
Set the interval when checking for new updates.
This defaults to 5 seconds.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
