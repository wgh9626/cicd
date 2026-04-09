# agent

这是一个用于演示和验证 CI/CD 流程的多应用示例仓库，包含后端、前端和移动端等不同类型项目。

## 仓库目标

- 统一管理多种应用的示例代码
- 为 Jenkins 流水线提供固定的 Jenkinsfile 与构建路径
- 为镜像构建、GitOps 更新和 Argo CD 同步提供测试样例
- 验证从代码提交到部署通知的完整链路

## 目录说明

- `apps/java-service`：Java 服务示例
- `apps/go-service`：Go Web 服务示例
- `apps/admin-web`：前端静态站点示例
- `apps/mobile-app`：移动端构建示例
- `demo-java-service`：独立的 Java 服务发布样例

## CI/CD 流程概览

1. 代码推送到 GitHub
2. Jenkins 根据对应 `Jenkinsfile` 拉取代码并执行构建
3. 使用 Kaniko 构建并推送镜像
4. 更新 GitOps 清单中的镜像版本
5. Argo CD 自动同步到目标环境
6. 通过 Argo CD Notifications 发送部署结果通知

## 当前示例

- Go 服务：提供最小可运行 HTTP 服务
- 前端应用：提供最小静态页面构建输出
- Java 服务：用于演示后端服务发布流程

## 自动触发 Jenkins 的建议

如果希望后续代码一推送到 GitHub 就自动触发 Jenkins，推荐使用 **GitHub Webhook + Jenkins Generic Webhook Trigger / GitHub Integration**。

推荐做法：

- 在 GitHub 仓库中配置 Webhook，监听 `push` 事件
- 在 Jenkins 对应任务中开启 webhook 触发能力
- 按目录拆分不同 Job，例如：
  - `apps/go-service/Jenkinsfile`
  - `apps/admin-web/Jenkinsfile`
  - `apps/java-service/Jenkinsfile`
- 如需更精细控制，可结合分支过滤和路径过滤，只在目标目录变更时触发对应流水线

## 说明

本仓库主要用于打通和验证流水线，不追求业务完整性，重点是让构建、发版、同步和通知链路稳定可复用。
