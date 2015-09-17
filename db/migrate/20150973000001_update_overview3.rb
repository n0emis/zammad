class UpdateOverview3 < ActiveRecord::Migration
  def up
    UserInfo.current_user_id = 1
    overview_role = Role.where( name: 'Agent' ).first
    Overview.create_or_update(
      name: 'My assigned Tickets',
      link: 'my_assigned',
      prio: 1000,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [ 1, 2, 3, 7 ],
        },
        'ticket.owner_id' => {
          operator: 'is',
          value: 'current_user.id',
        },
      },
      order: {
        by: 'created_at',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group created_at),
        s: %w(title customer group created_at),
        m: %w(number title customer group created_at),
        view_mode_default: 's',
      },
    )

    Overview.create_or_update(
      name: 'My pending reached Tickets',
      link: 'my_pending_reached',
      prio: 1010,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: 3,
        },
        'ticket.owner_id' => {
          operator: 'is',
          value: 'current_user.id',
        },
        'ticket.pending_time' => {
          operator: 'after (relative)',
          value: '1',
        },
      },
      order: {
        by: 'created_at',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group created_at),
        s: %w(title customer group created_at),
        m: %w(number title customer group created_at),
        view_mode_default: 's',
      },
    )

    Overview.create_or_update(
      name: 'Unassigned & Open Tickets',
      link: 'all_unassigned',
      prio: 1020,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [1, 2, 3],
        },
        'ticket.owner_id' => {
          operator: 'is',
          value: 1,
        },
      },
      order: {
        by: 'created_at',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group created_at),
        s: %w(title customer group created_at),
        m: %w(number title customer group created_at),
        view_mode_default: 's',
      },
    )

    Overview.create_or_update(
      name: 'All Open Tickets',
      link: 'all_open',
      prio: 1030,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [1, 2, 3],
        },
      },
      order: {
        by: 'created_at',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group state owner created_at),
        s: %w(title customer group state owner created_at),
        m: %w(number title customer group state owner created_at),
        view_mode_default: 's',
      },
    )

    Overview.create_or_update(
      name: 'All pending reached Tickets',
      link: 'all_pending_reached',
      prio: 1035,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [3],
        },
        'ticket.pending_time' => {
          operator: 'after (relative)',
          value: 1,
        },
      },
      order: {
        by: 'created_at',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group owner created_at),
        s: %w(title customer group owner created_at),
        m: %w(number title customer group owner created_at),
        view_mode_default: 's',
      },
    )

    Overview.create_or_update(
      name: 'Escalated Tickets',
      link: 'all_escalated',
      prio: 1040,
      role_id: overview_role.id,
      condition: {
        'ticket.escalation_time' => {
          operator: 'before (relative)',
          value: 5,
        },
      },
      order: {
        by: 'escalation_time',
        direction: 'ASC',
      },
      view: {
        d: %w(title customer group owner escalation_time),
        s: %w(title customer group owner escalation_time),
        m: %w(number title customer group owner escalation_time),
        view_mode_default: 's',
      },
    )

    overview_role = Role.where( name: 'Customer' ).first
    Overview.create_or_update(
      name: 'My Tickets',
      link: 'my_tickets',
      prio: 1000,
      role_id: overview_role.id,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [ 1, 2, 3, 4, 6 ],
        },
        'ticket.customer_id' => {
          operator: 'is',
          value: 'current_user.id',
        },
      },
      order: {
        by: 'created_at',
        direction: 'DESC',
      },
      view: {
        d: %w(title customer state created_at),
        s: %w(number title state created_at),
        m: %w(number title state created_at),
        view_mode_default: 's',
      },
    )
    Overview.create_or_update(
      name: 'My Organization Tickets',
      link: 'my_organization_tickets',
      prio: 1100,
      role_id: overview_role.id,
      organization_shared: true,
      condition: {
        'ticket.state_id' => {
          operator: 'is',
          value: [ 1, 2, 3, 4, 6 ],
        },
        'ticket.organization_id' => {
          operator: 'is',
          value: 'current_user.organization_id',
        },
      },
      order: {
        by: 'created_at',
        direction: 'DESC',
      },
      view: {
        d: %w(title customer state created_at),
        s: %w(number title customer state created_at),
        m: %w(number title customer state created_at),
        view_mode_default: 's',
      },
    )
  end
end
