<?php
/**
 * 課題と対策の表(Approach・Next で共通)。
 *   $args['columns'] 列の見出し(スマートフォンでは各セルのラベルにもなる)
 *   $args['fields']  各行から列の順に読む入力欄の名前
 *   $args['rows']    入力欄の行
 *   $args['duo']     2列の表なら true
 */
?>
    <div class="par-table<?php echo $args['duo'] ? ' par-duo' : ''; ?> fade">
      <div class="par-header">
<?php foreach ( $args['columns'] as $column ) : ?>
        <div class="par-col"><?php echo esc_html( $column ); ?></div>
<?php endforeach; ?>
      </div>
      <ul class="par-list">
<?php foreach ( $args['rows'] as $row ) : ?>
        <li>
          <span class="role"><?php echo esc_html( $row['role'] ); ?></span>
<?php foreach ( $args['columns'] as $i => $column ) : ?>
          <div class="par-col">
            <span class="mobile-label"><?php echo esc_html( $column ); ?></span>
            <p><?php fp_text( $row[ $args['fields'][ $i ] ], true ); ?></p>
          </div>
<?php endforeach; ?>
        </li>
<?php endforeach; ?>
      </ul>
    </div>
