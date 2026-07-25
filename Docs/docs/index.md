# FlexKVM

**即插即用的硬件级带外管理设备。** 将它接入目标主机的 HDMI 和 USB，你就能通过浏览器或 Tailscale 网络，随时随地查看屏幕、控制键鼠、开关电源、挂载 ISO —— 即使目标系统宕机、无显卡驱动、甚至未安装操作系统。

> 无需在被控主机上安装任何软件，无需公网 IP，只要网络可达，机房就在你手边。

<div class="image-carousel">
  <div class="carousel-slides">
    <img src="images/product/generated_26.webp" alt="FlexKVM 产品展示 7" class="carousel-slide active">
    <img src="images/product/generated_19.webp" alt="FlexKVM 产品展示 1" class="carousel-slide">
    <img src="images/product/generated_20.webp" alt="FlexKVM 产品展示 2" class="carousel-slide">
    <img src="images/product/generated_21.webp" alt="FlexKVM 产品展示 3" class="carousel-slide">
    <img src="images/product/generated_22.webp" alt="FlexKVM 产品展示 4" class="carousel-slide">
    <img src="images/product/generated_23.webp" alt="FlexKVM 产品展示 5" class="carousel-slide">
    <img src="images/product/generated_24.webp" alt="FlexKVM 产品展示 6" class="carousel-slide">
  </div>
  <button class="carousel-btn carousel-prev" aria-label="上一张"><svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg></button>
  <button class="carousel-btn carousel-next" aria-label="下一张"><svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/></svg></button>
  <div class="carousel-dots">
    <span class="carousel-dot active"></span>
    <span class="carousel-dot"></span>
    <span class="carousel-dot"></span>
    <span class="carousel-dot"></span>
    <span class="carousel-dot"></span>
    <span class="carousel-dot"></span>
    <span class="carousel-dot"></span>
  </div>
</div>

<div class="hero-actions" markdown>
[快速入门 :octicons-rocket-24:](quick_start/index.md){ .md-button .md-button--primary }
[用户指南 :material-book-open-page-variant:](guide/index.md){ .md-button }
</div>

---

## 它解决什么问题

| 痛点 | FlexKVM 的方案 |
|------|---------------|
| 服务器宕机，SSH/RDP 连不上，只能搬显示器去机房 | 硬件级捕获 HDMI 信号，系统崩溃也能远程看屏幕 |
| 无头设备 BIOS 需要调整，每次都要接显示器 | 远程键鼠控制直达 BIOS/UEFI，像坐在本地一样操作 |
| 偏远站点系统故障，派人上门成本高、耗时长 | 内置 Tailscale 异地组网，总部直接远程重装系统 |
| 现场没有网络，没法远程连设备 | 网线直连（DHCP 服务器）+ WiFi 6 热点双通道，无需路由器，手机或电脑任选其一接入 |

---

## 谁在使用 FlexKVM

<div class="grid cards" markdown>

- **:material-server: 企业 IT / 数据中心**

    服务器宕机后在办公室就能查看蓝屏、进 BIOS、远程重装系统，省去工程师跑机房的麻烦。

- **:material-home: Homelab 与数码爱好者**

    NAS、软路由、All-in-One 不接显示器，出启动故障不再需要搬电视。随时远程调整启动项、重装系统。

- **:material-satellite-uplink: 边缘计算与 IoT**

    基站、无人机房、偏远站点故障，从总部通过 Tailscale 远程维护，停机从小时级压缩到分钟级。

- **:material-robot: 嵌入式与工业自动化**

    工控机、PLC 封闭在机柜里，FlexKVM 捕获 HDMI + UART 串口双通道调试，快速定位产线故障。

</div>

---

## 核心功能

<div class="grid cards" markdown>

- **:material-monitor-eye: 远程桌面控制**

    纯硬件捕获 HDMI 信号，最高 1920x1200@60Hz。不依赖操作系统、显卡驱动或远程服务 —— BIOS、蓝屏、安全模式都能看见。

- **:material-headset: 双向音频**

    模拟 USB 音频设备，被控主机的系统声音实时传回浏览器，操作端麦克风输出到被控主机。

- **:material-power: 远程开关机**

    ATX 控制接口实现电源远程管理，支持正常开关机、强制重启、强制断电。

- **:material-disc: 虚拟光驱**

    使用TF卡做为虚拟光驱，能实现文件双向传输，远程安装系统等功能。

- **:material-vpn: 异地组网（Tailscale）**

    内置 Tailscale 客户端，无需公网 IP、无需端口转发，端到端加密的虚拟网络开箱即用。

- **:material-wifi-arrow-left-right: 双网冗余**

    双频 WiFi6 + 百兆有线，双网同时在线，任一网络发生故障，不影响控制

- **:material-lan-connect: 无网控制**

    没路由器，没WIFI也不怕。网线直连电脑（DHCP 服务器模式）+ WiFi 6 自建热点，双通道零依赖接入，装机、调 BIOS、排查故障照干不误。

- **:material-fan-off: 低功耗静音**

    典型功耗 1.5W ~ 2.4W，铝合金被动散热，无风扇，7x24 小时安静运行。

- **:material-console-line: 串口与 GPIO 扩展**

    提供 UART 串口通信与 GPIO 控制，满足嵌入式调试、工业自动化、看门狗等扩展需求。

- **:material-magnet-on: 多场景部署**

    磁吸背板/35mm机柜夹/自定义背板 多种方式固定，适配桌面、机柜、工业现场等场景。

- **:material-radiator: 铝合金散热**

    铝合金壳体被动散热，无风扇、零噪音、不积灰，可以适应部分高温场景。

- **:material-package-variant-closed: 极致小巧**

    仅 65 × 46 × 22 mm，重约 100 g，随身携带无负担。

</div>

---

## 核心规格

| 项目 | 参数 |
|------|------|
| 尺寸 | 65 × 46 × 22 mm（不含天线） |
| 重量 | 约 100 g |
| 电源 | 5V / 1A（USB Type-C） |
| 典型功耗 | 1.5 W ~ 2.4 W |
| 视频输入 | HDMI 1.4，最高 1920×1200@60Hz |
| 音频 | 双向音频 |
| 无线网络 | 双频 WiFi6 |
| 有线网络 | RJ45 百兆以太网 |
| 外部存储 | 最高支持 512G TF 卡 |
| 外设拓展 | 双路 GPIO + 一路 UART 串口 |
| 工作温度 | 0°C ~ 70°C |

---

## 文档资料

<div class="grid cards" markdown>

- **:material-rocket-launch: 快速入门**

    5 分钟从接线到远程控制，带图的完整流程。

    [:octicons-arrow-right-24: 开始使用](quick_start/index.md)

- **:material-book-open-page-variant: 用户指南**

    完整的功能说明和配置教程，按场景或按功能查阅。

    [:octicons-arrow-right-24: 查看指南](guide/index.md)

- **:material-chat-question: 常见问题与排查**

    FAQ 快速解答 + 按症状排查故障。

    [:octicons-arrow-right-24: 获取帮助](support/index.md)

- **:material-account-group: 社区与联系**

    反馈建议、加入社群、联系我们。

    [:octicons-arrow-right-24: 了解更多](community/index.md)

</div>

---

## 购买与更新

<div class="grid cards" markdown>

- **:material-cart: 购买 FlexKVM**

    前往官方淘宝店购买。

    [:octicons-arrow-right-24: 前往购买](https://item.taobao.com/item.htm?id=1054030596204)

- **:material-text-box-multiple: 更新日志**

    查看版本更新历史和新功能。

    [:octicons-arrow-right-24: 更新日志](changelog/index.md)

</div>

> 需要查看其他固件版本的文档？使用顶部导航栏的**版本选择器**切换。

