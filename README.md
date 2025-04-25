# Gestión de MFA y Teams

## Descripción General
Este proyecto proporciona scripts y módulos para gestionar la Autenticación de Múltiples Factores (MFA) y las cuotas de Teams dentro de una organización. Incluye funcionalidades para resetear MFA para usuarios y ajustar las cuotas de almacenamiento para grupos de Teams en SharePoint.

## Funcionalidades
- **Reset MFA**: Permite a usuarios autorizados resetear la configuración de MFA para usuarios específicos.
- **Cuotas Teams**: Permite a usuarios autorizados aumentar la cuota de almacenamiento para grupos de Teams en SharePoint.

## Requisitos Previos
1. PowerShell 5.1 o superior
2. Módulos requeridos:
   - Microsoft.Graph.Authentication
   - Microsoft.Graph.Users
   - Microsoft.Graph.Teams
   ```powershell
   Install-Module Microsoft.Graph.Authentication
   Install-Module Microsoft.Graph.Users
   Install-Module Microsoft.Graph.Teams
   ```
3. Permisos adecuados en Azure AD y SharePoint

## Instalación
1. Clone el repositorio:
   ```powershell
   git clone https://github.com/tuorganizacion/mfa-teams-management.git
   cd mfa-teams-management
   ```

2. Importe los módulos necesarios:
   ```powershell
   Import-Module .\src\modules\MFAModule.psm1
   Import-Module .\src\modules\TeamsQuotaModule.psm1
   Import-Module .\src\modules\Common.psm1
   ```

## Uso

### Reset MFA
Para resetear el MFA de un usuario:

```powershell
.\src\scripts\Reset-MFA.ps1 -RequesterUPN admin@empresa.com -UserUPN usuario@empresa.com
```

Parámetros:
- `RequesterUPN`: El UPN del administrador que solicita el reset (debe tener permisos)
- `UserUPN`: El UPN del usuario cuyo MFA se va a resetear

Ejemplo de respuesta exitosa:
```
{
    "Success": true,
    "Message": "MFA reseteado correctamente para usuario@empresa.com",
    "Timestamp": "2025-04-25 14:45:00"
}
```

### Ajuste de Cuota Teams
Para ajustar la cuota de un grupo Teams:

```powershell
.\src\scripts\Set-TeamsQuota.ps1 -RequesterUPN admin@empresa.com -TeamsGroup "Equipo Ventas" -SpaceAmount 500
```

Parámetros:
- `RequesterUPN`: El UPN del administrador que solicita el cambio
- `TeamsGroup`: Nombre del grupo de Teams
- `SpaceAmount`: Cantidad de espacio en MB (opcional, por defecto 100MB)

## Gestión de Errores
Los scripts proporcionan mensajes detallados en caso de error:

- Errores de permisos:
  ```
  {
      "Success": false,
      "Message": "El usuario no tiene permisos para realizar esta acción",
      "ErrorCode": "AUTH001"
  }
  ```

- Errores de validación:
  ```
  {
      "Success": false,
      "Message": "El grupo de Teams especificado no existe",
      "ErrorCode": "TEAM001"
  }
  ```

## Logs
Los logs se almacenan en:
```
C:\ProgramData\MFATeamsManagement\logs\
```

Formato del log:
```
[2025-04-25 14:45:00] [INFO] Iniciando reset MFA para usuario@empresa.com
[2025-04-25 14:45:01] [SUCCESS] MFA reseteado correctamente
```

## Pruebas
Para ejecutar las pruebas unitarias:

```powershell
cd tests
Invoke-Pester .\Reset-MFA.Tests.ps1 -Output Detailed
Invoke-Pester .\Set-TeamsQuota.Tests.ps1 -Output Detailed
```

## Documentación Adicional
- [Documentación Reset MFA](docs/Reset-MFA.md)
- [Documentación Cuotas Teams](docs/Set-TeamsQuota.md)

## Soporte
Para reportar problemas o solicitar ayuda, contacte al equipo de soporte:
- Email: soporte@empresa.com
- Teams: Canal Soporte IT

## Licencia
Este proyecto está licenciado bajo la Licencia MIT. Ver el archivo LICENSE para más detalles.