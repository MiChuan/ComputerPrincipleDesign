# Do-it-yourself CPU（计算机硬件系统设计）

[![Logisim](https://img.shields.io/badge/Design-Logisim-0078D6.svg)](http://www.cburch.com/logisim/)
[![MIPS](https://img.shields.io/badge/ISA-MIPS32-2C8E5C.svg)](https://en.wikipedia.org/wiki/MIPS_architecture)
[![Pipeline](https://img.shields.io/badge/Pipeline-5--stage-8A2BE2.svg)](https://en.wikipedia.org/wiki/Instruction_pipelining)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/MiChuan/ComputerPrincipleDesign?style=social)](https://github.com/MiChuan/ComputerPrincipleDesign/stargazers)

本项目基于 MIT License 开源发布，欢迎在遵守许可证条款的前提下自由使用、修改与再发布。

## 目录导航

- [项目简介](#introduction)
- [技术特性](#features)
- [项目结构](#structure)
- [实验资料](#materials)
- [环境要求](#requirements)
- [快速开始](#quick-start)
- [常见问题](#faq)
- [开源声明与版权归属](#open-source-statement--copyright)
- [其他说明](#notes)

<a id="introduction"></a>
## 项目简介

Do-it-yourself CPU 是《计算机硬件系统设计》课程的实践项目，基于 **Logisim** 平台从零设计并实现一款 **MIPS 五段流水线 CPU**。项目覆盖流水线架构、中断处理、寄存器堆与存储器设计、动态分支预测、Cache 映射策略等计算机组成原理核心内容，并通过 MIPS 汇编程序完成功能验证，实现文本输入、图像显示、音乐播放、视频播放等应用效果。

项目全程无需任何硬件平台，使用 Logisim 图形化搭建电路，适合计算机组成原理课程学习、实验与设计参考。

<a id="features"></a>
## 技术特性

- **流水线架构**：实现五段流水线 CPU，通过数据转发与流水线停顿等机制解决冲突冒险，提升处理器性能
- **中断处理**：集成中断处理机制，支持单级与多级中断（含 EPC 内存 / 硬件堆栈保护两种方案），增强对外部事件的响应能力
- **存储设计**：实现 MIPS 寄存器堆与 RAM 存储器，支持数据存储与快速访问
- **动态分支预测**：采用 BHT 与 BTB 结合的策略，减少流水线停顿，提升执行效率
- **缓存设计**：实现 Cache 的多种映射策略（直接相联、全相联、组相联），优化数据访问速度
- **验证与测试**：编写 MIPS 汇编程序验证流水线设计，覆盖常用指令、分支、数据相关、中断、排序与多媒体演示等场景

<a id="structure"></a>
## 项目结构

```text
ComputerPrincipleDesign/
├── CPU24/                        # CPU24 版本电路与单周期控制器设计
│   ├── cpu24.circ                # CPU24 电路（含分阶段版本）
│   ├── cs3410.jar                # Logisim 扩展库
│   ├── 单周期硬布线控制器表达式自动生成.xlsx
│   ├── MIPS32指令手册.pdf
│   └── MIPS_Green_Sheet.pdf
├── CPU28/                        # CPU28 版本电路（流水线 + 中断）
│   ├── cpu28（2-5）.circ         # CPU28 主电路
│   ├── cpu28（2-5）test.circ     # CPU28 测试电路
│   ├── 中断按键信号产生.circ     # 中断信号产生电路
│   ├── 单周期控制器 / 周期数统计 / 流水线时空图对比（Excel）
│   └── cs3410.jar
├── educode/                      # 头歌平台评测电路与中断测试程序
│   ├── cpu28（2-26）test.circ    # 评测电路
│   ├── 单级 / 多级中断测试程序（.asm / .hex）
│   ├── 中断信号测试模拟电路.circ
│   └── 测试日志（SingleIntlog.txt / NestIntlog.txt）
├── image/                        # 实验要求（docx / pdf）与演示截图
├── log/                          # 流水线测试日志（bubble / redirect / 排序测试）
├── test/                         # MIPS 汇编测试程序与机器码（.asm / .hex）
├── 汇编工具及测试用例4.32/       # MARS 汇编器与指令测试用例
│   ├── Mars4_5.jar               # MIPS 汇编与模拟工具
│   └── 指令测试用例（.asm / .hex）
├── LICENSE                       # MIT 许可证
└── README.md                     # 项目说明（本文件）
```

<a id="materials"></a>
## 实验资料

- **实验环境**：[logisim-ita-cn-20200118](https://gitee.com/totalcontrol/hustzc/)，Java 平台，支持 Windows / Linux / macOS，无需任何硬件平台
- **实验资料下载**：https://gitee.com/totalcontrol/hustzc/
- **数字逻辑在线实验**：https://www.educoder.net/paths/yrbse2cf （头歌平台）
- **计算机组成在线实验**：https://www.educoder.net/paths/hvbz6g9i （头歌平台）

<a id="requirements"></a>
## 环境要求

- Java 运行环境（Logisim 依赖）
- Logisim（推荐 logisim-ita-cn 中文版）
- MARS 4.5（MIPS 汇编 / 模拟器，随仓库提供于 `汇编工具及测试用例4.32/`）

<a id="quick-start"></a>
## 快速开始

```bash
git clone https://github.com/MiChuan/ComputerPrincipleDesign.git
```

1. 使用 Logisim 打开测试电路，如 `CPU28/cpu28（2-5）test.circ` 或 `educode/cpu28（2-26）test.circ`
2. 准备测试程序：`test/` 与 `汇编工具及测试用例4.32/` 中的 `.asm` 为汇编源码，`.hex` 为可直接加载到 Logisim ROM / RAM 的机器码
3. 如需自行汇编：使用 MARS 打开 `.asm` 汇编生成机器码，保存为 `.hex` 格式时需在第一行添加 `v2.0 raw` 头
4. 运行电路，可参考 `log/` 目录下的测试日志（bubble / redirect / 排序测试）核对结果

<a id="faq"></a>
## 常见问题

### 1. 电路文件无法打开

请使用 logisim-ita-cn 版本打开，并确保 `cs3410.jar` 与电路文件位于同一目录，避免自定义组件缺失。

### 2. 测试程序无法加载到 ROM / RAM

`.hex` 为 Logisim 内存加载格式；如使用 MARS 汇编生成，需在第一行添加 `v2.0 raw` 头，并按 Logisim 要求调整数据格式。

### 3. 测试用例从哪里获取

`test/` 与 `汇编工具及测试用例4.32/` 包含大量指令级测试（如分支、跳转、乘除、移位、中断等），可直接使用或参考 `log/` 中的运行日志。

### 4. 是否需要硬件环境

不需要。全部实验基于 Logisim 软件完成，支持 Windows / Linux / macOS 平台。

<a id="open-source-statement--copyright"></a>
## 开源声明与版权归属

本项目基于 MIT License 开源发布（详见 [LICENSE](LICENSE)）。在保留原始署名与许可证声明的前提下，使用者可以自由复制、修改、分发、再发布，或用于个人学习与二次开发。

若将本项目代码用于课程设计、毕业设计展示或二次开发，建议保留原作者信息、仓库地址及许可说明，以尊重原始创作贡献。

<a id="notes"></a>
## 其他说明

- 本项目为计算机硬件系统设计课程实践，电路基于 Logisim 图形化搭建，测试用例覆盖常用 MIPS 指令及中断、分支预测等进阶特性。
- 实验要求与演示材料位于 `image/` 目录，可配合阅读。
- 仓库内包含分阶段版本电路（CPU24 / CPU28 及日期版本），可按需查看演进过程。
